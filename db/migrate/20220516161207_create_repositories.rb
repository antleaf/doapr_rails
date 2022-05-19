class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :academic_applicant_only
      t.string :accepted_content_formats
      t.string :accepted_content_languages
      t.string :accepted_content_level
      t.string :accepted_content_types
      t.string :accepted_supplementary_content
      t.string :access_to_content
      t.string :access_to_metadata
      t.string :accessibility_of_conflict_of_interest_procedures
      t.string :account_creation
      t.string :associated_editor
      t.string :associated_journal
      t.string :author_pid
      t.string :availability_of_associated_content
      t.string :backups
      t.references :business_model, null: true, foreign_key: true
      t.string :certificate_or_labels
      t.string :closure_date
      t.string :contact
      t.string :description
      t.string :disciplinary_scope
      t.string :editorial_notes
      t.string :full_name
      t.string :functional_description
      t.string :funding
      t.string :interoperability
      t.string :journal_submission
      t.string :keywords
      t.string :last_update
      t.string :launch_date
      t.string :licensing
      t.string :mechanisms_to_report_concerns_about_content
      t.string :mechanisms_to_report_concerns_about_plagiarism
      t.string :metadata_formats
      t.string :metadata_languages
      t.string :metadata_properties
      t.string :method_for_reuse_of_metadata
      t.string :moderation
      t.string :oai_pmh_url
      t.string :objectives
      t.string :open_source
      t.string :opendoar_id
      t.references :country, null: true, foreign_key: true
      t.string :owner_full_name
      t.string :owner_short_name
      t.string :owner_url
      t.string :ownership_type
      t.string :peer_review_status_indication
      t.string :permission_for_re_use_of_metadata
      t.string :persistence_of_content
      t.string :persistent_identifier
      t.references :platform, null: true, foreign_key: true
      t.string :platform_languages
      t.string :preservation_policy
      t.string :record_count
      t.string :remining_indrawn_item
      t.string :repository_type
      t.string :scientific_technical_committees
      t.string :service_pricing
      t.string :short_name
      t.references :status, null: true, foreign_key: true
      t.string :terms_of_use
      t.string :text_embargo
      t.string :time_from_submission_to_posting
      t.string :url
      t.string :user_committees
      t.string :versioning_policy
      t.string :who_can_deposit
      t.string :withdrawal_authorisation
      t.string :withdrawal_policy
      t.string :slug

      t.timestamps
    end
    add_index :repositories, :slug, unique: true
  end
end
