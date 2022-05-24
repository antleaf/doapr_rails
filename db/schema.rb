# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_24_103401) do
  create_table "business_models", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_business_models_on_slug", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "latitude"
    t.string "longitude"
    t.string "continent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_countries_on_slug", unique: true
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_disciplines_on_slug", unique: true
  end

  create_table "disciplines_repositories", id: false, force: :cascade do |t|
    t.integer "discipline_id", null: false
    t.integer "repository_id", null: false
  end

  create_table "functions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_functions_on_slug", unique: true
  end

  create_table "passwordless_sessions", force: :cascade do |t|
    t.string "authenticatable_type"
    t.integer "authenticatable_id"
    t.datetime "timeout_at", precision: nil, null: false
    t.datetime "expires_at", precision: nil, null: false
    t.datetime "claimed_at", precision: nil
    t.text "user_agent", null: false
    t.string "remote_addr", null: false
    t.string "token", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["authenticatable_type", "authenticatable_id"], name: "authenticatable"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "source_code"
    t.string "software_license"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_platforms_on_slug", unique: true
  end

  create_table "repositories", force: :cascade do |t|
    t.string "academic_applicant_only"
    t.string "accepted_content_formats"
    t.string "accepted_content_languages"
    t.string "accepted_content_level"
    t.string "accepted_content_types"
    t.string "accepted_supplementary_content"
    t.string "access_to_content"
    t.string "access_to_metadata"
    t.string "accessibility_of_conflict_of_interest_procedures"
    t.string "account_creation"
    t.string "associated_editor"
    t.string "associated_journal"
    t.string "author_pid"
    t.string "availability_of_associated_content"
    t.string "backups"
    t.integer "business_model_id"
    t.string "certificate_or_labels"
    t.string "closure_date"
    t.string "contact"
    t.string "description"
    t.string "disciplinary_scope"
    t.string "editorial_notes"
    t.string "full_name"
    t.string "functional_description"
    t.string "funding"
    t.string "interoperability"
    t.string "journal_submission"
    t.string "keywords"
    t.string "last_update"
    t.string "launch_date"
    t.string "licensing"
    t.string "mechanisms_to_report_concerns_about_content"
    t.string "mechanisms_to_report_concerns_about_plagiarism"
    t.string "metadata_formats"
    t.string "metadata_languages"
    t.string "metadata_properties"
    t.string "method_for_reuse_of_metadata"
    t.string "moderation"
    t.string "oai_pmh_url"
    t.string "objectives"
    t.string "open_source"
    t.string "opendoar_id"
    t.integer "country_id"
    t.string "owner_full_name"
    t.string "owner_short_name"
    t.string "owner_url"
    t.string "ownership_type"
    t.string "peer_review_status_indication"
    t.string "permission_for_re_use_of_metadata"
    t.string "persistence_of_content"
    t.string "persistent_identifier"
    t.integer "platform_id"
    t.string "platform_languages"
    t.string "preservation_policy"
    t.string "record_count"
    t.string "remining_indrawn_item"
    t.string "repository_type"
    t.string "scientific_technical_committees"
    t.string "service_pricing"
    t.string "short_name"
    t.integer "status_id"
    t.string "terms_of_use"
    t.string "text_embargo"
    t.string "time_from_submission_to_posting"
    t.string "url"
    t.string "user_committees"
    t.string "versioning_policy"
    t.string "who_can_deposit"
    t.string "withdrawal_authorisation"
    t.string "withdrawal_policy"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_model_id"], name: "index_repositories_on_business_model_id"
    t.index ["country_id"], name: "index_repositories_on_country_id"
    t.index ["platform_id"], name: "index_repositories_on_platform_id"
    t.index ["slug"], name: "index_repositories_on_slug", unique: true
    t.index ["status_id"], name: "index_repositories_on_status_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.integer "cost"
    t.string "slug"
    t.text "editorial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_services_on_slug", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_statuses_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "lastname"
    t.string "forename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "repositories", "business_models"
  add_foreign_key "repositories", "countries"
  add_foreign_key "repositories", "platforms"
  add_foreign_key "repositories", "statuses"
end
