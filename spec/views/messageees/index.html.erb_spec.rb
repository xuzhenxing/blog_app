require 'spec_helper'

describe "messageees/index" do
  before(:each) do
    assign(:messageees, [
      stub_model(Messageee,
        :asd => "Asd"
      ),
      stub_model(Messageee,
        :asd => "Asd"
      )
    ])
  end

  it "renders a list of messageees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Asd".to_s, :count => 2
  end
end
