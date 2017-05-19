require 'rails_helper'

RSpec.describe "trans/index", type: :view do
  before(:each) do
    assign(:trans, [
      Tran.create!(
        :english => "English",
        :chinese => "Chinese"
      ),
      Tran.create!(
        :english => "English",
        :chinese => "Chinese"
      )
    ])
  end

  it "renders a list of trans" do
    render
    assert_select "tr>td", :text => "English".to_s, :count => 2
    assert_select "tr>td", :text => "Chinese".to_s, :count => 2
  end
end
