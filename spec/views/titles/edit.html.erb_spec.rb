require 'rails_helper'

RSpec.describe "titles/edit", type: :view do
  before(:each) do
    @title = assign(:title, Title.create!(
      :content => "MyString"
    ))
  end

  it "renders the edit title form" do
    render

    assert_select "form[action=?][method=?]", title_path(@title), "post" do

      assert_select "input[name=?]", "title[content]"
    end
  end
end
