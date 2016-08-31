require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :addressable => nil,
      :residence => 2,
      :street => "Street",
      :street_number => "Street Number",
      :city => "City",
      :zip_code => "Zip Code",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Street Number/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/State/)
  end
end
