class ClientsController < ApplicationController
  
  before_action :set_client, only: [:show, :edit, :update]
  before_action :authenticate_user!
  after_action :verify_authorized
  
  def index
    @clients = Client.all
    authorize current_user
  end
  
  def show
    authorize @client
  end
  
  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    authorize @client
    
    if @client.save
      redirect_to clients_path, notice: "Klient \"#{@client.company_name}\" byl úspěšně vytvořen."
    else
      render :new
    end
  end  

  def edit
    authorize @client
  end
  
  def update
    authorize @client
    
    if @client.update(client_params)
      redirect_to @client, notice: "Klient \"#{@client.company_name}\" byl upraven."
    else
      render :edit
    end
  end

  def delete
  end
  
  def destroy
    client = Client.find(params[:id])
    authorize client
    client.destroy
    
    redirect_to clients_url, notice: "Klient \"#{client.company_name}\" byl úspěšně smazán."
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      if current_user.admin? || current_user.manager?
        params.require(:client).permit(:company_name, :email, :phone_number, :vat_id, :contact_person_name, :contact_phone, :public)
      else
        params.require(:client).permit()
      end
    end
  
end
