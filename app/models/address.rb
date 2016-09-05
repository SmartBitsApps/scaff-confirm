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
  
  enum residence: [:permanent, :postal]
  enum status: [:inactive, :active]
  
  
  
  #validates_presence_of :street, unless: :residence?
  #validates_presence_of :street, :if => Proc.new { |user| user.signup_step > 2 }
#  validates_presence_of :street, reject_if: proc { |attributes| attributes['street'].blank? }
#  validates_presence_of :street_number, :unless => :street?
#  validates_presence_of :city, :unless => :street?
#  validates_presence_of :zip_code, :unless => :street?
  
  
end
