# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  project_id  :integer
#  position_id :integer
#  quantity    :integer
#  alternates  :integer
#  manager_id  :integer
#  what_bring  :text
#  start_date  :string
#  end_date    :string
#  public      :boolean          default(FALSE)
#  status      :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :job do
    event nil
    position_id 1
    quantity 1
    alternates 1
    manager_id 1
    what_bring "MyText"
    start_date "MyString"
    end_date "MyString"
    public false
    status 1
  end
end
