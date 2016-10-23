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
    index?
  end

  def update?
    index?
  end

  def destroy?
    index? && @client.owner_id == @current_user.id
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
