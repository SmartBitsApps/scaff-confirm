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
  
  enum degree_before: [:ing, :phdr]
  enum degree_after: [:csc, :dis]
  enum gender: { "muž" => 0, "žena" => 1 }
  enum nationality: { "česká" => 0, "slovenská" => 1 }
  enum family_status: { "svobodný/á" => 0, "ženatý/vdaná" => 1, "vdovec/vdova" => 2 }
  enum insurance: { "111 - VZP" => 0, "201 - VOZP" => 1, "205 - ČPZP" => 2, "207 - OZP" => 3, "209 - ZPŠ" => 4, "211 - ZPMV" => 5, "213 - RBP" => 6 }
  
  enum status: [:started, :completed, :approved]
  
  # set default entries
  after_initialize :set_default_values, :if => :new_record?
  
  def set_default_values
    self.status ||= :started
    self.terms  ||= false
  end
  
end
