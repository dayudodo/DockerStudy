require 'rails_helper'

RSpec.describe "titles/new", type: :view do
  before(:each) do
    assign(:title, Title.new(
      :content => "MyString"
    ))
  end

  it "renders new title form" do
    render

    assert_select "form[action=?][method=?]", titles_path, "post" do

      assert_select "input[name=?]", "title[content]"
    end
  end
end
