FactoryGirl.define do
  factory :project do
    user nil
    title "MyString"
    description "MyText"
    manager_id 1
    public false
  end
end
