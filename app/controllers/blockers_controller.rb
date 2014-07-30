class BlockersController < ApplicationController
  before_action :set_blocker, only: [:show, :edit, :update, :destroy]
  before_action :set_cohort, only: [:index, :new, :create]

  # GET /blockers
  # GET /blockers.json
  def index
    @blockers = Blocker.where(cohort_id: @cohort.id)
    @blocker = Blocker.new
    @user_blocker = UserBlocker.new
  end

  # GET /blockers/1
  # GET /blockers/1.json
  def show
  end

  def adduser
    @user_blocker = UserBlocker.new(user_blocker_params)

    respond_to do |format|
      if @user_blocker.save
        format.html { redirect_to cohort_blockers_path(@user_blocker.blocker.cohort) }
      else
        format.html { redirect_to cohort_blockers_path(@user_blocker.blocker.cohort) }
      end
    end
  end

  # GET /blockers/new
  def new
    @blocker = Blocker.new
  end

  # GET /blockers/1/edit
  def edit
  end

  # POST /blockers
  # POST /blockers.json
  def create
    @blocker = Blocker.new(blocker_params)

    respond_to do |format|
      if @blocker.save
        format.html { redirect_to @blocker, notice: 'Blocker was successfully created.' }
        format.json { render :show, status: :created, location: @blocker }
      else
        format.html { render :new }
        format.json { render json: @blocker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blockers/1
  # PATCH/PUT /blockers/1.json
  def update
    respond_to do |format|
      if @blocker.update(blocker_params)
        format.html { redirect_to @blocker, notice: 'Blocker was successfully updated.' }
        format.json { render :show, status: :ok, location: @blocker }
      else
        format.html { render :edit }
        format.json { render json: @blocker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blockers/1
  # DELETE /blockers/1.json
  def destroy
    @blocker.destroy
    respond_to do |format|
      format.html { redirect_to cohort_blockers_path(@blocker.cohort), notice: 'Blocker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_blocker
      @blocker = Blocker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blocker_params
      params.require(:blocker).permit(:blocker, :cohort_id)
    end

    def user_blocker_params
      params.require(:user_blocker).permit(:user_id, :blocker_id)
    end
end
