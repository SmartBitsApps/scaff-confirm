class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_filter :authenticate_user!
  #after_action :verify_authorized
  
  def index
    
    @users = User.all
    authorize current_user
  end
  
  def show
    authorize @user
  end
  
  def edit
    authorize current_user
  end
  
  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "Uživatel aktualizován."
    else
      redirect_to users_path, :alert => "Nebylo možné uživatele aktualizovat."
    end
  end
  
  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "Uživatel byl smazán."
  end
  
  private
  
    def full_name
		  self.full_name = [first_name, last_name].join(' ')
    end
  
    def set_user
      @user = User.find(params[:id])
    end

    def secure_params
      params.require(:user).permit(:role, :avatar, :first_name, :last_name, :degree_before, :degree_after, :birth_name, 
                                  :birth_date, :gender, :birth_number, :birth_place, :nationality, 
                                  :family_status, :status)
    end
  
end
