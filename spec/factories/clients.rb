# == Schema Information
#
# Table name: clients
#
#  id                  :integer          not null, primary key
#  company_name        :string
#  name                :string
#  email               :string
#  phone_number        :string
#  vat_id              :string
#  contact_person_name :string
#  contact_phone       :string
#  public              :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :client do
    company_name "MyString"
    name "MyString"
    email "MyString"
    phone_number "MyString"
    vat_id "MyString"
    contact_person_name "MyString"
    contact_phone "MyString"
    public false
  end
end
