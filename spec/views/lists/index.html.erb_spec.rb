require 'rails_helper'

RSpec.describe "lists/index", type: :view do
  before(:each) do
    assign(:lists, [
      List.create!(
        user_id: 2,
        book_id: 3
      ),
      List.create!(
        user_id: 2,
        book_id: 3
      )
    ])
  end

  it "renders a list of lists" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
