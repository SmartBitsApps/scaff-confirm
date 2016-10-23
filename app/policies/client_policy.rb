class ClientPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @client = model
  end

  def index?
    @current_user.admin? or @current_user.manager?
  end

  def show?
    index?
  end
  
  def new?
    index?
  end
  
  def create?
    index?
  end
  
  def edit?
    @current_user.admin? or @client.user_id == @current_user.id
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
