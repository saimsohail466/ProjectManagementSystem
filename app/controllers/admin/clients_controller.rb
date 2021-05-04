class ClientsController > ApplicationController
  before_action :set_client, only: %i[show edit destroy update]
  
  def index
    @clients = Client.all 
  end

  def new
    @client = current_user.clients.new
  end

  def create
    @client = current_user.clients.create()
    if @client.save
      redirect_to @client, notice: "Client added successfully.."
    else
      render "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client updated successfully.."
    else
      render "edit"
    end
  end

  def destroy
    if @client.destroy
      redirect_to clients_path, notice: "Client destroy successfully.."
    end
  end

  private

  def client_params
    params.require(:client).permit(:firstname, :lastname, :email)
  end

  def set_client
    @client = Client.find(params[:id])
  end 
end
