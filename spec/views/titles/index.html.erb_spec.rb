require 'rails_helper'

RSpec.describe "titles/index", type: :view do
  before(:each) do
    assign(:titles, [
      Title.create!(
        :content => "Content"
      ),
      Title.create!(
        :content => "Content"
      )
    ])
  end

  it "renders a list of titles" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
