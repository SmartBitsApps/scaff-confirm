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
  
end
