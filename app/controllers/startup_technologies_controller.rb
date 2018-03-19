class StartupTechnologiesController < ApplicationController
  before_action :set_startup_technology, only: [:show, :edit, :update, :destroy]

  # GET /startup_technologies
  # GET /startup_technologies.json
  def index
    
    @startup_technologies = StartupTechnology.all
  end

  # GET /startup_technologies/1
  # GET /startup_technologies/1.json
  def show
  end

  # GET /startup_technologies/new
  def new
    @startup_technology = StartupTechnology.new
  end

  # GET /startup_technologies/1/edit
  def edit
  end

  # POST /startup_technologies
  # POST /startup_technologies.json
  def create
    @startup_technology = StartupTechnology.new(startup_technology_params)

    respond_to do |format|
      if @startup_technology.save
        format.html { redirect_to @startup_technology, notice: 'Startup technology was successfully created.' }
        format.json { render :show, status: :created, location: @startup_technology }
      else
        format.html { render :new }
        format.json { render json: @startup_technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /startup_technologies/1
  # PATCH/PUT /startup_technologies/1.json
  def update
    respond_to do |format|
      if @startup_technology.update(startup_technology_params)
        format.html { redirect_to @startup_technology, notice: 'Startup technology was successfully updated.' }
        format.json { render :show, status: :ok, location: @startup_technology }
      else
        format.html { render :edit }
        format.json { render json: @startup_technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startup_technologies/1
  # DELETE /startup_technologies/1.json
  def destroy
    @startup_technology.destroy
    respond_to do |format|
      format.html { redirect_to startup_technologies_url, notice: 'Startup technology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_startup_technology
      @startup_technology = StartupTechnology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def startup_technology_params
      params.fetch(:startup_technology, {})
    end
end
