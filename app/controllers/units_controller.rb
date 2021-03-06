class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  before_action :set_cohort, only: [:new, :create]
  
  # GET /units
  # GET /units.json
  def index
    @units = Unit.all
  end

  # GET /units/1
  # GET /units/1.json
  def show

  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save     
        @unit.related_materials.create(related_material_params)
        format.html { redirect_to cohort_path(params[:cohort_id]), notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :description, :cohort_id, :visible)
    end

    def related_material_params
      params.require(:unit).permit(:attachable_id, :attachable_type, :file)
    end

        def check_position
      if @task.nil? && !@unit.nil?
          @unit.tasks.each do |task|
          if task.position.nil?
            tasks_in_unit = @unit.tasks.length
            task.position = tasks_in_unit
            task.position.save
            return task.position
          elsif task.position.class == Fixnum
            return task.position
          else 
            return "error in check_position"
          end # check for value of task position
        end # end do loop of unit's tasks
      else
        if @task.position.nil?
          parent_unit = @task.unit
          tasks_in_unit = parent_unit.tasks.length
          @task.position = tasks_in_unit
          return @task.position
        elsif @task.position.class == Fixnum
          return @task.position
        else 
          return "error in check_position"
        end # check for value of task position
      end # check for task or unit being nil
    end # check position method
end
