class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  
  def index?
    @current_user.admin? || @current_user.manager?
  end
  
  def admins?
    @current_user.admin?
  end
  
  def managers?
    @current_user.admin? || @current_user.manager?
  end

  def show?
    @current_user.admin? || @current_user.manager? || @current_user == @user
  end
  
  def edit?
    @current_user.admin? || @current_user.manager?
  end

  def update?
    @current_user.admin? || @current_user.manager?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin? || @current_user.manager?
  end

end