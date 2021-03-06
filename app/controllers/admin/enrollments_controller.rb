class Admin::EnrollmentsController < AdminController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = school.enrollments
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.school = school

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to :back,
          notice: "#{@enrollment.user.username.capitalize} successfully enrolled in #{@enrollment.cohort.name}." }
        format.json { render :show, status: :created, location: admin_enrollment_path(@enrollment) }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to admin_enrollment_path(@enrollment),
          notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_enrollment_path(@enrollment) }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to :back,
        notice: "#{@enrollment.user.username.capitalize} has been unenrolled from #{@enrollment.cohort.name}." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:user_id, :cohort_id, :role_id)
    end
end
