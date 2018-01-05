require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :prvkey => "Prvkey",
      :pubkey => "Pubkey"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Prvkey/)
    expect(rendered).to match(/Pubkey/)
  end
end
