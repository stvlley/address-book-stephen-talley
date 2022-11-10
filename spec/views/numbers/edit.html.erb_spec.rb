require 'rails_helper'

RSpec.describe "numbers/edit", type: :view do
  let(:number) {
    Number.create!(
      phone_number: "",
      comment: "MyText"
    )
  }

  before(:each) do
    assign(:number, number)
  end

  it "renders the edit number form" do
    render

    assert_select "form[action=?][method=?]", number_path(number), "post" do

      assert_select "input[name=?]", "number[phone_number]"

      assert_select "textarea[name=?]", "number[comment]"
    end
  end
end
