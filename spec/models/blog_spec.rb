require 'spec_helper'

describe Blog do
  let(:user) { FactoryGirl.create(:user) }
  before { @blog = user.blogs.build(title: "Lorem ipsum") }

  subject { @blog }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:approved_comments_count) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid}

  describe "when user_id is not present" do
  	before { @blog.user_id = nil }
  	it { should_not be_valid}
  end
  describe "when user_id is not present" do
    before { @blog.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @blog.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @blog.title = "a" * 40 }
    it { should_not be_valid }
  end
end