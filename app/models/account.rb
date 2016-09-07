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
#

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses
  #before_validation :check_for_filled_all_columns, only: [:update]
  
  
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
  
  def build_new_address
    #self.addresses ||= 
    self.addresses.build(residence: 0, status: 1)
    self.addresses.build(residence: 1, status: 0)
  end
  
  private
  
  #def check_for_filled_all_columns
  #  self.attributes.each do |attr|
  #    return false if self[attr].nil?
  #  end
  #end
  
end
