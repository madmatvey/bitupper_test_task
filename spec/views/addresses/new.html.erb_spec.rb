require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :prvkey => "MyString",
      :pubkey => "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_prvkey[name=?]", "address[prvkey]"

      assert_select "input#address_pubkey[name=?]", "address[pubkey]"
    end
  end
end
