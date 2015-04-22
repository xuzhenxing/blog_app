require 'spec_helper'

describe "messageees/show" do
  before(:each) do
    @messageee = assign(:messageee, stub_model(Messageee,
      :asd => "Asd"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Asd/)
  end
end
