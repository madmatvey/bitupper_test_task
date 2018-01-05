require 'rails_helper'

RSpec.describe "txes/index", type: :view do
  before(:each) do
    assign(:txes, [
      Tx.create!(
        :hash => "Hash",
        :txdata => ""
      ),
      Tx.create!(
        :hash => "Hash",
        :txdata => ""
      )
    ])
  end

  it "renders a list of txes" do
    render
    assert_select "tr>td", :text => "Hash".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
