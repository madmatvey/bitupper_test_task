require 'rails_helper'

RSpec.describe "txes/show", type: :view do
  before(:each) do
    @tx = assign(:tx, Tx.create!(
      :hash => "Hash",
      :txdata => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Hash/)
    expect(rendered).to match(//)
  end
end
