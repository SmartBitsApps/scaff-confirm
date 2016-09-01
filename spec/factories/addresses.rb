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

FactoryGirl.define do
  factory :address do
    addressable nil
    residence 1
    street "MyString"
    street_number "MyString"
    city "MyString"
    zip_code "MyString"
    state "MyString"
  end
end
