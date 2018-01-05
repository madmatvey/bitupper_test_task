require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :prvkey => "Prvkey",
        :pubkey => "Pubkey"
      ),
      Address.create!(
        :prvkey => "Prvkey",
        :pubkey => "Pubkey"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Prvkey".to_s, :count => 2
    assert_select "tr>td", :text => "Pubkey".to_s, :count => 2
  end
end
