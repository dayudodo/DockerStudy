require 'rails_helper'

RSpec.describe "trans/new", type: :view do
  before(:each) do
    assign(:tran, Tran.new(
      :english => "MyString",
      :chinese => "MyString"
    ))
  end

  it "renders new tran form" do
    render

    assert_select "form[action=?][method=?]", trans_path, "post" do

      assert_select "input[name=?]", "tran[english]"

      assert_select "input[name=?]", "tran[chinese]"
    end
  end
end
