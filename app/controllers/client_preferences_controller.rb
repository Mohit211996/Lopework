class ClientPreferencesController < ApplicationController
  before_action :set_client_preference, only: [:show, :edit, :update, :destroy]

  # GET /client_preferences
  # GET /client_preferences.json
  def index
    @client_preferences = ClientPreference.all
  end

  # GET /client_preferences/1
  # GET /client_preferences/1.json
  def show
  end

  # GET /client_preferences/new
  def new
    @client_preference = ClientPreference.new
  end

  # GET /client_preferences/1/edit
  def edit
  end

  # POST /client_preferences
  # POST /client_preferences.json
  def create
    
  @temp = params[:user_id].split(",");
  
  @temp.each_with_index do |temp, index|
    @client_preference = ClientPreference.new
    @client_preference.project_id=params[:project_id];
    if(index==0)
      @client_preference.startup_status_id=4;
    else
    @client_preference.startup_status_id=params[:startup_status_id];
    end
    @client_preference.user_id=temp;
    @client_preference.save
  end
      

    respond_to do |format|
        format.html { redirect_to @client_preference, notice: 'Client preference was successfully created.' }
        format.json { render :show, status: :created, location: @client_preference }
    end
  end

  # PATCH/PUT /client_preferences/1
  # PATCH/PUT /client_preferences/1.json
  def update
    respond_to do |format|
      if @client_preference.update(client_preference_params)
        format.html { redirect_to @client_preference, notice: 'Client preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_preference }
      else
        format.html { render :edit }
        format.json { render json: @client_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_preferences/1
  # DELETE /client_preferences/1.json
  def destroy
    @client_preference.destroy
    respond_to do |format|
      format.html { redirect_to client_preferences_url, notice: 'Client preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_preference
      @client_preference = ClientPreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_preference_params
      params.permit(:id,:project_id,:startup_status_id,:user_id)
    end
end
