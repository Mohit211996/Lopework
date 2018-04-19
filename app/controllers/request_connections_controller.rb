class RequestConnectionsController < ApplicationController
  before_action :set_request_connection, only: [:show, :edit, :update, :destroy]

  # GET /request_connections
  # GET /request_connections.json
  def index
    @request_connections = RequestConnection.all
  end

  # GET /request_connections/1
  # GET /request_connections/1.json
  def show
  end

  # GET /request_connections/new
  def new
    @request_connection = RequestConnection.new
  end

  # GET /request_connections/1/edit
  def edit
  end

  # POST /request_connections
  # POST /request_connections.json
  def create
    @request_connection = RequestConnection.new(request_connection_params)

    @startup_id = params[:request_connection][:startup_id].to_i
    @count = RequestConnection.where("user_id = ? AND startup_id = ?",current_user.id,@startup_id).count
    @count_connection = Connection.where("user_id = ? AND startup_id = ?",current_user.id,@startup_id).count
  if @count_connection == 0
    if @count == 0
      @request_connection.save
      @text = "Cancel Request"
    else
      @request_connection = RequestConnection.where("user_id = ? AND startup_id = ?",current_user.id,@startup_id).first
      @request_connection.destroy
      @text = "Send Request"
    end
    
  else
    @connection = Connection.where("user_id = ? AND startup_id = ?",current_user.id,@startup_id).first
    @connection.destroy
    @text = "Send Request"
  end
    respond_to do |format|
    format.js
    end
  end

  # PATCH/PUT /request_connections/1
  # PATCH/PUT /request_connections/1.json
  def update
    respond_to do |format|
      if @request_connection.update(request_connection_params)
        format.html { redirect_to @request_connection, notice: 'Request connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_connection }
      else
        format.html { render :edit }
        format.json { render json: @request_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_connections/1
  # DELETE /request_connections/1.json
  def destroy
    @request_connection.destroy
    respond_to do |format|
      format.html { redirect_to request_connections_url, notice: 'Request connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_connection
      @request_connection = RequestConnection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_connection_params
     params.require(:request_connection).permit(:id,:user_id,:startup_id)
    end
end
