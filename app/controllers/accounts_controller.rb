class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all.order(created_at: :desc)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    @permanent_address = Address.where(addressable_id: @account.user_id).where(addressable_type: "Account").where(residence: 0)
    @postal_address = Address.where(addressable_id: @account.user_id).where(addressable_type: "Account").where(residence: 1)
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Účet byl úspěšně vytvořen.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    binding.pry
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Účet byl úspěšně upraven.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Účet byl úspěšně smazán.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      #TODO: change this for admin and manager accounts
      if current_user #!current_admin || !current_manager
        @account = Account.find_by(user_id: current_user.id)
      else
        @account = Account.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:user_id, :phone_number, :degree_before, :degree_after, :birth_name,
                                      :birth_date, :gender, :birth_place, :birth_number, :nationality,
                                      :family_status, :bank_acc, :insurance, :terms, :status,
                                      addresses_attributes: [:id, :addressable_id, :addressable_type, :residence, :street, :street_number, :city, :zip_code, :state])
    end
end
