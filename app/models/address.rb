# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_id   :integer
#  addressable_type :string
#  residence        :integer
#  street           :string
#  street_number    :string
#  city             :string
#  zip_code         :string
#  state            :string
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  
  enum residence: [:permanent, :postal]
  enum status: [:inactive, :active, :same_as_permanent] #TODO: :same_as_permanent for (residence :postal) ONLY!
  
  validates_presence_of :street, on: :update #if: -> { current_step?(:add_address) }
  validates_presence_of :street_number, on: :update #, if: -> { current_step?(:add_address) }
  validates_presence_of :city, on: :update #, if: -> { current_step?(:add_address) }
  validates_presence_of :zip_code, on: :update #, if: -> { current_step?(:add_address) }
  validates_presence_of :state, on: :update #, if: -> { current_step?(:add_address) }
  
  #validates_presence_of :street, unless: :residence?
  #validates_presence_of :street, :if => Proc.new { |user| user.signup_step > 2 }
#  validates_presence_of :street, reject_if: proc { |attributes| attributes['street'].blank? }
#  validates_presence_of :street_number, :unless => :street?
#  validates_presence_of :city, :unless => :street?
#  validates_presence_of :zip_code, :unless => :street?
  
  def current_step?(step_key)
    account = Account.where(id: self.addressable_id).first
    account.current_step == step_key.to_s
    binding.pry
  end
end
