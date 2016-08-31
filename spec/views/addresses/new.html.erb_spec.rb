require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :addressable => nil,
      :residence => 1,
      :street => "MyString",
      :street_number => "MyString",
      :city => "MyString",
      :zip_code => "MyString",
      :state => "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_addressable_id[name=?]", "address[addressable_id]"

      assert_select "input#address_residence[name=?]", "address[residence]"

      assert_select "input#address_street[name=?]", "address[street]"

      assert_select "input#address_street_number[name=?]", "address[street_number]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_zip_code[name=?]", "address[zip_code]"

      assert_select "input#address_state[name=?]", "address[state]"
    end
  end
end
