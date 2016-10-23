# == Schema Information
#
# Table name: accounts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  phone_number  :string
#  degree_before :integer
#  degree_after  :integer
#  birth_name    :string
#  birth_date    :string
#  gender        :integer
#  birth_place   :string
#  birth_number  :string
#  nationality   :integer
#  family_status :integer
#  bank_acc      :string
#  insurance     :integer
#  terms         :boolean          default(FALSE)
#  status        :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  current_step  :string
#

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses#, update_only: true
  mattr_accessor :current_step
  #before_validation :check_for_filled_all_columns, only: [:update]
  
  #validates_presence_of 
  #validates_inclusion_of :field_name, :in => [true, false]
  #validates :phone_number, :presence => true, :if => :completed?
  
  #validates :phone_number, :presence => true, on: :update
  
  #validates_presence_of :cmpyname, :abnacn, :cmpyadd, :cmpydet, if: -> { current_step?(:business) }
  
  validates_presence_of :phone_number, if: -> { current_step?(:add_personal) }
  validates_presence_of :gender, if: -> { current_step?(:add_personal) }
  
  validates_presence_of :birth_name, if: -> { current_step?(:add_birth) }
  validates_presence_of :birth_date, if: -> { current_step?(:add_birth) }
  validates_presence_of :birth_place, if: -> { current_step?(:add_birth) }
  validates_presence_of :birth_number, if: -> { current_step?(:add_birth) }
  
  validates_presence_of :bank_acc, if: -> { current_step?(:add_bank) }
  validates_presence_of :insurance, if: -> { current_step?(:add_bank) }
  
  validates_associated :addresses, if: -> { current_step?(:add_address) }
  
  
  #validates_presence_of :phone_number
  #validates_presence_of :gender
  #validates_presence_of :birth_name
  #validates_presence_of :birth_date
  #validates_presence_of :birth_place
  #validates_presence_of :birth_number
  #validates_presence_of :bank_acc
  #validates_presence_of :insurance
  #validates_presence_of :street
  #validates_presence_of :street_number
  #validates_presence_of :city
  #validates_presence_of :zip_code
  #validates_presence_of :state
  

  #validates_inclusion_of :gender, :in => ["muž", "žena"], if: -> {current_step?(:add_personal)  }
  
  #validates :price_category, presence: true, if: -> (restaurant) { restaurant.price_category || price_category.price_category_id }
  #validates :price_category, presence: true, if: 'price_category_id.present?'
  #validate :degree_before, :if => :degree_before?
  #<%= f.collection_select :city_id, City.all, :id, :name %>
  
  
  enum degree_before: { "Ing." => 0, "Mgr." => 1, "Bc." => 2, "PhDr." => 3, "MUDr." => 4, "JUDr." => 5 }
  enum degree_after: { "DiS." => 0, "Ph.D." => 1, "MBA" => 2, "CSc." => 3 }
  enum gender: { "muž" => 0, "žena" => 1 }
  enum nationality: { "česká" => 0, "slovenská" => 1 }
  enum family_status: { "svobodný/á" => 0, "ženatý/vdaná" => 1, "vdovec/vdova" => 2, "rozvedený/á" => 3, "druh/družka" => 4, "registrované partnerství" => 5 }
  enum insurance: { "111 - VZP" => 0, "201 - VOZP" => 1, "205 - ČPZP" => 2, "207 - OZP" => 3, "209 - ZPŠ" => 4, "211 - ZPMV" => 5, "213 - RBP" => 6 }
  
  enum status: [:started, :completed, :approved]
  
  # set default entries
  after_initialize :set_default_values, :if => :new_record?
  after_initialize :build_new_address, :if => :new_record?
  
  def set_default_values
    self.status ||= :started
    self.terms  ||= false
  end
  
  # imediately for new record build permanent and postal addresses
  def build_new_address
    #self.addresses ||= 
    self.addresses.build(residence: 0, status: 1)
    self.addresses.build(residence: 1, status: 0)
  end
  
  # information for wicked steps form
  def current_step?(step_key)
    
    self.current_step == step_key.to_s
  end
  
  #def addresses_attributes=(addresses_attributes)
  #
  #  addresses_attributes.each do |i, address_attributes|
  #    self.addresses.build(address_attributes)
  #  end
  #end
      
  private
  
  #def check_for_filled_all_columns
  #  self.attributes.each do |attr|
  #    return false if self[attr].nil?
  #  end
  #end
  
  
end
