require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      salutation: "MyString",
      first_name: "MyString",
      middle_name: "MyString",
      last_name: "MyString",
      ssn: 1,
      comment: "MyText"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[salutation]"

      assert_select "input[name=?]", "person[first_name]"

      assert_select "input[name=?]", "person[middle_name]"

      assert_select "input[name=?]", "person[last_name]"

      assert_select "input[name=?]", "person[ssn]"

      assert_select "textarea[name=?]", "person[comment]"
    end
  end
end
