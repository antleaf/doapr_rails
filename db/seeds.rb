require 'csv'
require './db/seeds_helpers'

source_data_folder_path = "#{File.dirname(__FILE__)}/source_data/2022-05-16"

Role.destroy_all
User.destroy_all
Discipline.destroy_all
Repository.destroy_all
BusinessModel.destroy_all
BusinessModel.create(name: '_unknown')
Status.destroy_all
Status.create(name: '_unknown')
Platform.destroy_all
Platform.create(name: '_unknown')
Country.destroy_all
Country.create(name: '_unknown')

admin_role = Role.create(name: 'admin')
editor_role = Role.create(name: 'editor')

admin_user = User.create(
  email: 'paul@paulwalk.net',
  forename: 'Paul',
  lastname: 'Walk'
)

admin_user.roles << admin_role
admin_user.roles << editor_role

CSV.foreach("#{source_data_folder_path}/DOAPR - Disciplines.csv", { headers: true }) do |row|
  Discipline.create(name: row['Name'])
end

CSV.foreach("#{source_data_folder_path}/DOAPR - Business Models.csv", { headers: true }) do |row|
  BusinessModel.create(name: row['Name'])
end

CSV.foreach("#{source_data_folder_path}/DOAPR - Statuses.csv", { headers: true }) do |row|
  Status.create(name: row['Name'])
end

CSV.foreach("#{source_data_folder_path}/DOAPR - Platforms.csv", { headers: true }) do |row|
  Platform.create(
    name: row['Name'],
    description: row['Description'],
    source_code: row['Source Code'],
    software_license: row['Software License']
  )
end

CSV.foreach("#{source_data_folder_path}/DOAPR - Countries.csv", { headers: true }) do |row|
  Country.create(
    name: row['Name'],
    code: row['Code'],
    latitude: row['Centre Latitude'],
    longitude: row['Centre Longitude'],
    continent: row['Continent']
  )
end

CSV.foreach("#{source_data_folder_path}/DOAPR - Repositories.csv", { headers: true }) do |row|
  repository = Repository.create(
    full_name: row['Full Name'],
    academic_applicant_only: row['Academic Applicant Only'],
    accepted_content_formats: row['Accepted Content Formats'],
    accepted_content_languages: row['Accepted Content Languages'],
    accepted_content_level: row['Accepted Content Level'],
    accepted_content_types: row['Accepted Content Types'],
    accepted_supplementary_content: row['Accepted Supplementary Content'],
    access_to_content: row['Access to content'],
    access_to_metadata: row['Access to metadata'],
    accessibility_of_conflict_of_interest_procedures: row['Accessibility Of Conflict Of Interest Procedures'],
    account_creation: row['Account Creation'],
    associated_editor: row['Associated Editor'],
    associated_journal: row['Associated Journal'],
    author_pid: row['Author PID'],
    availability_of_associated_content: row['Availability of Associated Content'],
    backups: row['Backups'],
    business_model: getBusinessModel(row['Business Model']),
    certificate_or_labels: row['Certificate or Labels'],
    closure_date: row['Closure Date'],
    contact: row['Contact'],
    description: row['Description'],
    disciplinary_scope: row['Disciplinary Scope'],
    editorial_notes: row['Editorial Notes'],
    functional_description: row['Functional Description'],
    funding: row['Funding'],
    interoperability: row['Interoperability'],
    journal_submission: row['Journal Submission'],
    keywords: row['Keywords'],
    last_update: row['Last Update'],
    launch_date: row['Launch Date'],
    licensing: row['Licensing'],
    mechanisms_to_report_concerns_about_content: row['Mechanisms To Report Concerns About Content'],
    mechanisms_to_report_concerns_about_plagiarism: row['Mechanisms To Report Concerns About Plagiarism'],
    metadata_formats: row['Metadata Format(s)'],
    metadata_languages: row['Metadata Languages'],
    metadata_properties: row['Metadata Properties'],
    method_for_reuse_of_metadata: row['Method For Re-use Of Metadata'],
    moderation: row['Moderation'],
    oai_pmh_url: row['OAI-PMH URL'],
    objectives: row['Objectives'],
    open_source: row['Open Source?'],
    opendoar_id: row['OpenDOAR ID'],
    owner_country: getCountry(row['Owner Country']),
    owner_full_name: row['Owner Full Name'],
    owner_short_name: row['Owner Short Name'],
    owner_url: row['Owner URL'],
    ownership_type: row['Ownership Type'],
    peer_review_status_indication: row['Peer-review Status Indication'],
    permission_for_re_use_of_metadata: row['Permission For Re-use Of Metadata'],
    persistence_of_content: row['Persistence of Content'],
    persistent_identifier: row['Persistent Identifier'],
    platform: getPlatform(row['Platform']),
    platform_languages: row['Platform Languages'],
    preservation_policy: row['Preservation Policy'],
    record_count: row['Record Count'],
    remining_indrawn_item: row['Remining Indrawn Item'],
    repository_type: row['Repository Type'],
    scientific_technical_committees: row['Scientific/Technical Committees'],
    service_pricing: row['Service Pricing'],
    short_name: row['Short Name'],
    status: getStatus(row['Status']),
    terms_of_use: row['Terms of Use'],
    text_embargo: row['Text Embargo'],
    time_from_submission_to_posting: row['Time from submission to posting'],
    url: row['URL'],
    user_committees: row['User Committees'],
    versioning_policy: row['Versioning Policy'],
    who_can_deposit: row['Who Can Deposit?'],
    withdrawal_authorisation: row['Withdrawal Authorisation'],
    withdrawal_policy: row['Withdrawal Policy']
  )
end
