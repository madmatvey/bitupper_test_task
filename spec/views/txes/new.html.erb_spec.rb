require 'rails_helper'

RSpec.describe "txes/new", type: :view do
  before(:each) do
    assign(:tx, Tx.new(
      :hash => "MyString",
      :txdata => ""
    ))
  end

  it "renders new tx form" do
    render

    assert_select "form[action=?][method=?]", txes_path, "post" do

      assert_select "input#tx_hash[name=?]", "tx[hash]"

      assert_select "input#tx_txdata[name=?]", "tx[txdata]"
    end
  end
end
