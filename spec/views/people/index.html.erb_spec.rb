require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        salutation: "Salutation",
        first_name: "First Name",
        middle_name: "Middle Name",
        last_name: "Last Name",
        ssn: 2,
        comment: "MyText"
      ),
      Person.create!(
        salutation: "Salutation",
        first_name: "First Name",
        middle_name: "Middle Name",
        last_name: "Last Name",
        ssn: 2,
        comment: "MyText"
      )
    ])
  end

  it "renders a list of people" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Salutation".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Middle Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
