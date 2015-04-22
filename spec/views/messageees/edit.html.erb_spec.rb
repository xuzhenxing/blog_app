require 'spec_helper'

describe "messageees/edit" do
  before(:each) do
    @messageee = assign(:messageee, stub_model(Messageee,
      :asd => "MyString"
    ))
  end

  it "renders the edit messageee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", messageee_path(@messageee), "post" do
      assert_select "input#messageee_asd[name=?]", "messageee[asd]"
    end
  end
end
