require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :addressable => nil,
        :residence => 2,
        :street => "Street",
        :street_number => "Street Number",
        :city => "City",
        :zip_code => "Zip Code",
        :state => "State"
      ),
      Address.create!(
        :addressable => nil,
        :residence => 2,
        :street => "Street",
        :street_number => "Street Number",
        :city => "City",
        :zip_code => "Zip Code",
        :state => "State"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Street Number".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
