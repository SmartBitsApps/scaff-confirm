class ClientsController < ApplicationController
  
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  
  def index
    @clients = Client.all
  end
  
  def show
  end
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
     
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Klient byl úspěšně vytvořen.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
    
  end  

  def edit
  end
  
  def update
    
    respond_to do |format|
      if @client.update(company_params)
        format.html { redirect_to @client, notice: 'Klient byl upraven.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def delete
  end
  
  def destroy
    
    @client.destroy
    
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Klient byl úspěšně smazán.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :email, :phone_number, :vat_id, :contact_person_name, :contact_phone, :public)
    end
  
end
