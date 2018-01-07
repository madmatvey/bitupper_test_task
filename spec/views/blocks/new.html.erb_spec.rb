require 'rails_helper'

RSpec.describe "blocks/new", type: :view do
  before(:each) do
    assign(:block, Block.new(
      :blhash => "MyString",
      :bldata => ""
    ))
  end

  it "renders new block form" do
    render

    assert_select "form[action=?][method=?]", blocks_path, "post" do

      assert_select "input#block_blhash[name=?]", "block[blhash]"

      assert_select "input#block_bldata[name=?]", "block[bldata]"
    end
  end
end
