class RepositoriesController < ApplicationController
  before_action :set_repository, only: %i[ show edit update destroy ]

  # GET /repositories or /repositories.json
  def index
    @repositories = Repository.all
  end

  # GET /repositories/1 or /repositories/1.json
  def show
  end

  # GET /repositories/new
  def new
    @repository = Repository.new
  end

  # GET /repositories/1/edit
  def edit
  end

  # POST /repositories or /repositories.json
  def create
    @repository = Repository.new(repository_params)

    respond_to do |format|
      if @repository.save
        format.html { redirect_to repository_url(@repository), notice: "Repository was successfully created." }
        format.json { render :show, status: :created, location: @repository }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repositories/1 or /repositories/1.json
  def update
    respond_to do |format|
      if @repository.update(repository_params)
        format.html { redirect_to repository_url(@repository), notice: "Repository was successfully updated." }
        format.json { render :show, status: :ok, location: @repository }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repositories/1 or /repositories/1.json
  def destroy
    @repository.destroy

    respond_to do |format|
      format.html { redirect_to repositories_url, notice: "Repository was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repository
      @repository = Repository.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repository_params
      params.require(:repository).permit(:academic_applicant_only, :accepted_content_formats, :accepted_content_languages, :accepted_content_level, :accepted_content_types, :accepted_supplementary_content, :access_to_content, :access_to_metadata, :accessibility_of_conflict_of_interest_procedures, :account_creation, :associated_editor, :associated_journal, :author_pid, :availability_of_associated_content, :backups, :business_model_id, :certificate_or_labels, :closure_date, :contact, :description, :disciplinary_scope, :editorial_notes, :full_name, :functional_description, :funding, :interoperability, :journal_submission, :keywords, :last_update, :launch_date, :licensing, :mechanisms_to_report_concerns_about_content, :mechanisms_to_report_concerns_about_plagiarism, :metadata_formats, :metadata_languages, :metadata_properties, :method_for_reuse_of_metadata, :moderation, :oai_pmh_url, :objectives, :open_source, :opendoar_id, :country_id, :owner_full_name, :owner_short_name, :owner_url, :ownership_type, :peer_review_status_indication, :permission_for_re_use_of_metadata, :persistence_of_content, :persistent_identifier, :platform_id, :platform_languages, :preservation_policy, :record_count, :remining_indrawn_item, :repository_type, :scientific_technical_committees, :service_pricing, :short_name, :status_id, :terms_of_use, :text_embargo, :time_from_submission_to_posting, :url, :user_committees, :versioning_policy, :who_can_deposit, :withdrawal_authorisation, :withdrawal_policy, :slug)
    end
end
