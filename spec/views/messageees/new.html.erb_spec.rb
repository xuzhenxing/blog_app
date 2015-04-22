require 'spec_helper'

describe "messageees/new" do
  before(:each) do
    assign(:messageee, stub_model(Messageee,
      :asd => "MyString"
    ).as_new_record)
  end

  it "renders new messageee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", messageees_path, "post" do
      assert_select "input#messageee_asd[name=?]", "messageee[asd]"
    end
  end
end
