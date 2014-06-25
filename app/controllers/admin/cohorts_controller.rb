class Admin::CohortsController < AdminController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]


  # Currently not in use
  def index
    @cohorts = school.cohorts
  end

  def show
    @enrollment = Enrollment.new
  end

  def new
    @cohort = Cohort.new
  end

  def edit
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.school = school

    respond_to do |format|
      if @cohort.save
        format.html { redirect_to admin_cohort_path(@cohort), notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: admin_cohort_path(@cohort) }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to admin_cohort_path(@cohort), notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_cohort_path(@cohort) }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Cohort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = @school.cohorts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_params
      params.require(:cohort).permit(:name, :description, :school_id)
    end
end
