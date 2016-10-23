# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :text
#  manager_id  :integer
#  client_id   :integer
#  public      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :project do
    user nil
    title "MyString"
    description "MyText"
    manager_id 1
    public false
  end
end
