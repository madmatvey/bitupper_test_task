require 'rails_helper'

RSpec.describe "blocks/show", type: :view do
  before(:each) do
    @block = assign(:block, Block.create!(
      :blhash => "Blhash",
      :bldata => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Blhash/)
    expect(rendered).to match(//)
  end
end
