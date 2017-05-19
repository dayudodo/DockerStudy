require 'rails_helper'

RSpec.describe "trans/edit", type: :view do
  before(:each) do
    @tran = assign(:tran, Tran.create!(
      :english => "MyString",
      :chinese => "MyString"
    ))
  end

  it "renders the edit tran form" do
    render

    assert_select "form[action=?][method=?]", tran_path(@tran), "post" do

      assert_select "input[name=?]", "tran[english]"

      assert_select "input[name=?]", "tran[chinese]"
    end
  end
end
