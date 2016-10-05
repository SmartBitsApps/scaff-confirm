# == Schema Information
#
# Table name: positions
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  requirements :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :position do
    title "MyString"
    description "MyText"
    requirements "MyText"
  end
end
