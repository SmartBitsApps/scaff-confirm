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
