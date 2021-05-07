class ClientsController < ApplicationController
  before_action :validate_user, only: %i[ edit show update destroy ]
  before_action :set_client, only: %i[ show edit update destroy ]

  def index
   @clients = current_user.get_clients
  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.create(client_params)

    if @client.save
      redirect_to clients_path
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
      redirect_to edit_client_path(@client)  
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:firstname, :lastname, :email)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def validate_user
    if user_signed_in?
      if current_user.employee?
        redirect_to root_path, notice: "You are not able to access this page.."
      end
    else
      redirect_to root_path, notice: "You are not currently signed in.."
    end
  end
end
