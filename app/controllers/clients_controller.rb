class ClientsController < ApplicationController
  before_action :validate_user
  before_action :set_client, only: %i[ show edit update destroy ]

  def index
    if current_user.admin? 
      @clients = Client.all
    elsif current_user.manager?
      @clients = current_user.clients  
    else
      redirect_to root_path, notice: "You Are not able access this page.."
    end
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
      redirect_to root_path, notice: "You are not loged in.."
    end
  end
end
