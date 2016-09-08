class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :confirmable, :lockable, :timeoutable, :rememberable, :trackable, :validatable
  
  has_one :manager_info, dependent: :destroy
  #accepts_nested_attributes_for :manager_info
  
  # Devise validates email and password automatically
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  
  enum status: [:banned, :active]
  
  # sets default settings and build account for user
  after_initialize :set_default_status, :if => :new_record?
  after_initialize :build_new_manager_info, :if => :new_record?
 
  
  def set_default_status
    self.status ||= :active
  end
  
  def build_new_manager_info
    #self.manager_info ||= self.build_manager_info()
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  
end
