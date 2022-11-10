require 'rails_helper'

RSpec.describe "numbers/new", type: :view do
  before(:each) do
    assign(:number, Number.new(
      phone_number: "",
      comment: "MyText"
    ))
  end

  it "renders new number form" do
    render

    assert_select "form[action=?][method=?]", numbers_path, "post" do

      assert_select "input[name=?]", "number[phone_number]"

      assert_select "textarea[name=?]", "number[comment]"
    end
  end
end
