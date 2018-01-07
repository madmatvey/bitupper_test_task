require 'rails_helper'

RSpec.describe "blocks/index", type: :view do
  before(:each) do
    assign(:blocks, [
      Block.create!(
        :blhash => "Blhash",
        :bldata => ""
      ),
      Block.create!(
        :blhash => "Blhash",
        :bldata => ""
      )
    ])
  end

  it "renders a list of blocks" do
    render
    assert_select "tr>td", :text => "Blhash".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
