require 'rails_helper'

RSpec.describe "lists/new", type: :view do
  before(:each) do
    assign(:list, List.new(
      user_id: 1,
      book_id: 1
    ))
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", lists_path, "post" do

      assert_select "input[name=?]", "list[user_id]"

      assert_select "input[name=?]", "list[book_id]"
    end
  end
end
