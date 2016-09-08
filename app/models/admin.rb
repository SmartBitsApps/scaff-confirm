class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  
  
  # Devise validates email and password automatically
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
