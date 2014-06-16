class TaksController < ApplicationController
  before_action :set_tak, only: [:show, :edit, :update, :destroy]

  # GET /taks
  # GET /taks.json
  def index
    @taks = Tak.all
  end

  # GET /taks/1
  # GET /taks/1.json
  def show
  end

  # GET /taks/new
  def new
    @tak = Tak.new
  end

  # GET /taks/1/edit
  def edit
  end

  # POST /taks
  # POST /taks.json
  def create
    @tak = Tak.new(tak_params)

    respond_to do |format|
      if @tak.save
        format.html { redirect_to @tak, notice: 'Tak was successfully created.' }
        format.json { render :show, status: :created, location: @tak }
      else
        format.html { render :new }
        format.json { render json: @tak.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taks/1
  # PATCH/PUT /taks/1.json
  def update
    respond_to do |format|
      if @tak.update(tak_params)
        format.html { redirect_to @tak, notice: 'Tak was successfully updated.' }
        format.json { render :show, status: :ok, location: @tak }
      else
        format.html { render :edit }
        format.json { render json: @tak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taks/1
  # DELETE /taks/1.json
  def destroy
    @tak.destroy
    respond_to do |format|
      format.html { redirect_to taks_url, notice: 'Tak was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tak
      @tak = Tak.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tak_params
      params.require(:tak).permit(:description, :visibility)
    end
end
