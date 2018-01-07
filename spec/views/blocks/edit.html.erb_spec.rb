require 'rails_helper'

RSpec.describe "blocks/edit", type: :view do
  before(:each) do
    @block = assign(:block, Block.create!(
      :blhash => "MyString",
      :bldata => ""
    ))
  end

  it "renders the edit block form" do
    render

    assert_select "form[action=?][method=?]", block_path(@block), "post" do

      assert_select "input#block_blhash[name=?]", "block[blhash]"

      assert_select "input#block_bldata[name=?]", "block[bldata]"
    end
  end
end
