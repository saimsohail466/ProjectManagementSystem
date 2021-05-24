class ClientsController < ApplicationController
  before_action :user_signed?, :validate_user
  before_action :set_client, only: %i[ show edit update destroy ]

  def index
   @clients = current_user.get_clients
  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.new(client_params)

    if @client.save
      redirect_to @client, notice: "Client created successfully.."
    else
      render "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: "successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:firstname, :lastname, :email, :street, :city, :country)
  end

  def set_client
    begin
      @client = Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "Record Not Found Against clients/" + params[:id].to_s
    end
  end

  def validate_user
    redirect_to root_path,
                alert: "You are not able to access this page.." if current_user.employee?
  end
end
