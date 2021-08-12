require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      postcode: "MyString",
      street: "MyString",
      complement: "MyString",
      district: "MyString",
      city: "MyString",
      state: "MyString",
      ibge_code: "MyString",
      citizen: nil
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[postcode]"

      assert_select "input[name=?]", "address[street]"

      assert_select "input[name=?]", "address[complement]"

      assert_select "input[name=?]", "address[district]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[state]"

      assert_select "input[name=?]", "address[ibge_code]"

      assert_select "input[name=?]", "address[citizen_id]"
    end
  end
end
