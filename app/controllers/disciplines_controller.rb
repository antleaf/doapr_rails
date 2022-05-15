class DisciplinesController < ApplicationController
  before_action :set_discipline, only: %i[ show edit update destroy ]

  # GET /disciplines or /disciplines.json
  def index
    @disciplines = Discipline.all
  end

  # GET /disciplines/1 or /disciplines/1.json
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines or /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to discipline_url(@discipline), notice: "Discipline was successfully created." }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1 or /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to discipline_url(@discipline), notice: "Discipline was successfully updated." }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1 or /disciplines/1.json
  def destroy
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: "Discipline was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discipline_params
      params.require(:discipline).permit(:name, :slug)
    end
end
