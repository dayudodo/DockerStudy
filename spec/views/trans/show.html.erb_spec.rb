require 'rails_helper'

RSpec.describe "trans/show", type: :view do
  before(:each) do
    @tran = assign(:tran, Tran.create!(
      :english => "English",
      :chinese => "Chinese"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/English/)
    expect(rendered).to match(/Chinese/)
  end
end
