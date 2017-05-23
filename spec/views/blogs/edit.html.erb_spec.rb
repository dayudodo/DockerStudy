require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :title => "MyString",
      :content => "MyString",
      :like => ""
    ))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do

      assert_select "input[name=?]", "blog[title]"

      assert_select "input[name=?]", "blog[content]"

      assert_select "input[name=?]", "blog[like]"
    end
  end
end
