class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :confirmable, :lockable, :timeoutable, :rememberable, :trackable, :validatable
end
