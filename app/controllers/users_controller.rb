class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  after_action :verify_authorized
  
  def index
    
    @users = User.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
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
      #TODO: add pundit for role (for admin and manager)
      if current_user.admin? || current_user.manager?
        params.require(:user).permit(:role, :status, :first_name, :last_name) #, :email
      else
        params.require(:user).permit(:first_name, :last_name) #,email
      end
      
      
      
    end
  
end
