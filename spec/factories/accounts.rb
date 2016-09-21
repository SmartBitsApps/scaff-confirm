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

FactoryGirl.define do
  factory :account do
    user nil
    phone_number "MyString"
    degree_before 1
    degree_after 1
    birth_name "MyString"
    birth_date "MyString"
    gender 1
    birth_place "MyString"
    birth_number "MyString"
    nationality 1
    family_status 1
    bank_acc "MyString"
    insurance 1
    terms false
    status 1
  end
end
