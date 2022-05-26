require 'csv'
require './db/seeds_helpers'

source_data_folder_path = "#{File.dirname(__FILE__)}/source_data/DOAPR-new-processed"

LOG.info("Set source folder path to #{source_data_folder_path}")
LOG.debug("Destroying all data...")

Role.destroy_all
User.destroy_all
Feature.destroy_all
Discipline.destroy_all
Repository.destroy_all
Service.destroy_all
BusinessModel.destroy_all
Status.destroy_all
Country.destroy_all
Function.destroy_all

LOG.info("All data destroyed")

LOG.debug("Creating roles and users...")
admin_role = Role.create(name: 'admin')
editor_role = Role.create(name: 'editor')

admin_user = User.create(
  email: 'paul@paulwalk.net',
  forename: 'Paul',
  lastname: 'Walk'
)

admin_user.roles << admin_role
admin_user.roles << editor_role

LOG.info("User and roles created, users allocated to roles")

LOG.debug("Creating functions...")
CSV.foreach("#{source_data_folder_path}/Functions-table_1.csv", { headers: true }) do |row|
  Function.create(name: row['name'])
end
LOG.info("Functions created")

LOG.debug("Creating disciplines...")
CSV.foreach("#{source_data_folder_path}/Disciplines-table_1.csv", { headers: true }) do |row|
  Discipline.create(name: row['name'])
end
LOG.info("Disciplines created")

LOG.debug("Creating business models...")
BusinessModel.create(name: "Non Profit")
BusinessModel.create(name: "For Profit")
LOG.info("Business models created")

LOG.debug("Creating statuses...")
Status.create(name: "Open")
Status.create(name: "Closed to Submission Only")
Status.create(name: "Closed and Inaccessible")
LOG.info("Statuses created")

#
# CSV.foreach("#{source_data_folder_path}/DOAPR - Platforms.csv", { headers: true }) do |row|
#   Platform.create(
#     name: row['Name'],
#     description: row['Description'],
#     source_code: row['Source Code'],
#     software_license: row['Software License']
#   )
# end
#

LOG.debug("Creating services...")
CSV.foreach("#{source_data_folder_path}/Services-table_1.csv", { headers: true }) do |row|
  service = Service.create(
    name: row['name'],
    description: row['description'],
    url: row['url']
  )
  if row['cost'] == 'completely_free' then
    service.completely_free!
  elsif row['cost'] == 'free_with_premium_features' then
    service.free_with_premium_features!
  elsif row['cost'] == 'premium_only' then
    service.premium_only!
  end
  service.save!
end
LOG.info("Services created")

LOG.debug("Creating countries...")
CSV.foreach("#{source_data_folder_path}/Countries-table_1.csv", { headers: true }) do |row|
  Country.create(
    name: row['name'],
    code: row['code'],
    latitude: row['latitude'],
    longitude: row['longitude'],
    continent: row['continent']
  )
end
LOG.info("Countries created")

LOG.debug("Creating repositories...")
CSV.foreach("#{source_data_folder_path}/Repositories-table_1.csv", { headers: true }) do |row|
  Repository.create(
    full_name: row['full_name'],
    url: row['url'],
    description: row['description'],
    opendoar_id: row['opendoar_id'],
    oai_pmh_url: row['oai_pmh_url'],
    editorial_notes: row['editorial_notes']
  )
end
LOG.info("Repositories created (basic info)")

LOG.debug("Adding metadata to repositories...")
CSV.foreach("#{source_data_folder_path}/Repositories-table_1.csv", { headers: true }).with_index(1) do |row, i|
  repository = Repository.friendly.find(row['slug'])
  if repository then
    if row['In Preprints list?'] == 'yes' then
      repository.academic_applicant_only = row['academic_applicant_only']
      repository.accepted_content_formats = row['accepted_content_formats']
      repository.accepted_content_languages = row['accepted_content_languages']
      repository.accepted_content_level = row['accepted_content_level']
      repository.accepted_content_types = row['accepted_content_types']
      repository.accepted_supplementary_content = row['accepted_supplementary_content']
      repository.access_to_content = row['access_to_content']
      repository.access_to_metadata = row['access_to_metadata']
      repository.accessibility_of_conflict_of_interest_procedures = row['accessibility_of_conflict_of_interest_procedures']
      repository.account_creation = row['account_creation']
      repository.associated_editor = row['associated_editor']
      repository.associated_journal = row['associated_journal']
      repository.author_pid = row['author_pid']
      repository.availability_of_associated_content = row['availability_of_associated_content']
      repository.backups = row['backups']
      repository.business_model = BusinessModel.friendly.find(row['business_model'])
      repository.certificate_or_labels = row['certificate_or_labels']
      repository.closure_date = row['closure_date']
      repository.contact = row['contact']
      repository.disciplinary_scope = row['disciplinary_scope']
      repository.functional_description = row['functional_description']
      repository.funding = row['funding']
      repository.interoperability = row['interoperability']
      repository.journal_submission = row['journal_submission']
      repository.keywords = row['keywords']
      repository.last_update = row['last_update']
      repository.launch_date = row['launch_date']
      repository.licensing = row['licensing']
      repository.mechanisms_to_report_concerns_about_content = row['mechanisms_to_report_concerns_about_content']
      repository.mechanisms_to_report_concerns_about_plagiarism = row['mechanisms_to_report_concerns_about_plagiarism']
      repository.metadata_formats = row['metadata_formats']
      repository.metadata_languages = row['metadata_languages']
      repository.metadata_properties = row['metadata_properties']
      repository.method_for_reuse_of_metadata = row['method_for_reuse_of_metadata']
      repository.moderation = row['moderation']
      repository.oai_pmh_url = row['oai_pmh_url']
      repository.objectives = row['objectives']
      repository.open_source = row['open_source']
      repository.owner_full_name = row['owner_full_name']
      repository.owner_short_name = row['owner_short_name']
      repository.owner_url = row['owner_url']
      repository.ownership_type = row['ownership_type']
      repository.peer_review_status_indication = row['peer_review_status_indication']
      repository.permission_for_re_use_of_metadata = row['permission_for_re_use_of_metadata']
      repository.persistence_of_content = row['persistence_of_content']
      repository.persistent_identifier = row['persistent_identifier']
      repository.platform = row['platform']
      repository.platform_languages = row['platform_languages']
      repository.preservation_policy = row['preservation_policy']
      repository.record_count = row['record_count']
      repository.remining_indrawn_item = row['remining_indrawn_item']
      repository.repository_type = row['repository_type']
      repository.scientific_technical_committees = row['scientific_technical_committees']
      repository.service_pricing = row['service_pricing']
      repository.short_name = row['short_name']
      repository.status = Status.friendly.find(row['status'])
      repository.terms_of_use = row['terms_of_use']
      repository.text_embargo = row['text_embargo']
      repository.time_from_submission_to_posting = row['time_from_submission_to_posting']
      repository.user_committees = row['user_committees']
      repository.versioning_policy = row['versioning_policy']
      repository.who_can_deposit = row['who_can_deposit']
      repository.withdrawal_authorisation = row['withdrawal_authorisation']
      repository.withdrawal_policy = row['withdrawal_policy']

      repository.save!

      ['text_mining', 'search_engine', 'bibliographic_references_management', 'metrics', 'indexing', 'other_features', 'writing', 'peer_review', 'commenting', 'revision_follow_up', 'endorsement', 'plagiarism_detection', 'communications_channels'].each do |function_field_name|
        if !(row[function_field_name] == nil || row[function_field_name].casecmp?('No')) then
          begin
            Feature.create(
              repository: repository,
              function: Function.friendly.find(function_field_name.gsub(/_/, '-')),
              description: row[function_field_name]
            )
          rescue Exception => e
            LOG.error("Problem with repository row #{i} - missing function: #{function_id}")
          end
        end
      end
      # i = 1

      ['writing_service', 'peer_review_service', 'commenting_service', 'revision_follow_up_service', 'endorsement_service', 'plagiarism_detection_service', 'metrics_service', 'indexing_service'].each do |field_name|
        if !(row[field_name] == nil || row[field_name].casecmp?('No')) then
          function_id = field_name[0..(field_name.index('_service') - 1)].gsub(/_/, '-')
          service_ids = row[field_name].split(';')
          service_ids.each do |service_id|
            begin
              Feature.create(
                repository: repository,
                function: Function.friendly.find(function_id),
                service: Service.friendly.find(service_id)
              )
            rescue Exception => e
              LOG.error("Problem with repository row #{i} - missing service: #{service_id} or function: #{function_id}")
            end
          end
        end
      end
    else
      LOG.warn("Repository with slug: #{row['slug']} not in preprints data source")
    end
  else
    LOG.error("Repository with slug: #{row['slug']} not found")
  end
end
LOG.info("Metadata added to repositories")

LOG.debug("Joining repositories and disciplines...")

CSV.foreach("#{source_data_folder_path}/Repositories_by_discipline-table_1.csv", { headers: true }).with_index(1) do |row, i|
  begin
    repo = Repository.friendly.find(row['repository'])
    discipline = Discipline.friendly.find(row['discipline'])
    repo.disciplines << discipline
  rescue Exception => e
    LOG.warn ("problem with row #{i} - #{row.inspect}")
  end
  i += 1
end
LOG.info("Repositories and disciplines joined")

LOG.debug("Joining repositories and countries...")

CSV.foreach("#{source_data_folder_path}/Repositories_by_country-table_1.csv", { headers: true }).with_index(1) do |row, i|
  begin
    repo = Repository.friendly.find(row['repository'])
    country = Country.friendly.find(row['country'])
    repo.countries << country
  rescue Exception => e
    LOG.error ("problem with row #{i} - #{row.inspect}")
  end
  i += 1
end
LOG.info("Repositories and countries joined")

LOG.debug("Joining services and functions...")

CSV.foreach("#{source_data_folder_path}/Services_by_function-table_1.csv", { headers: true }).with_index(1) do |row, i|
  begin
    service = Service.friendly.find(row['service'])
    function = Function.friendly.find(row['function'])
    service.functions << function
  rescue Exception => e
    LOG.error ("problem with row #{i} - #{row.inspect}")
  end
  i += 1
end
LOG.info("Services and functions joined")

LOG.info("COMPLETED")