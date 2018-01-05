require 'rails_helper'

RSpec.describe "txes/edit", type: :view do
  before(:each) do
    @tx = assign(:tx, Tx.create!(
      :hash => "MyString",
      :txdata => ""
    ))
  end

  it "renders the edit tx form" do
    render

    assert_select "form[action=?][method=?]", tx_path(@tx), "post" do

      assert_select "input#tx_hash[name=?]", "tx[hash]"

      assert_select "input#tx_txdata[name=?]", "tx[txdata]"
    end
  end
end
