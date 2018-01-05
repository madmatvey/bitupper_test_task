require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :prvkey => "MyString",
      :pubkey => "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_prvkey[name=?]", "address[prvkey]"

      assert_select "input#address_pubkey[name=?]", "address[pubkey]"
    end
  end
end
