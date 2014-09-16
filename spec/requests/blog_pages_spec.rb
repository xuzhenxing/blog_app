require 'spec_helper'

describe "Blog pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "blog creation" do
    before { visit newblog_path }

    describe "with invalid information" do

      it "should not create a blog" do
        expect { click_button "Create my Blog" }.not_to change(blog, :count)
      end

      describe "error messages" do
        before { click_button "Create my Blog" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in "title",         with: "test"
        fill_in "body",        with: "test"
        fill_in "time",     with: "now"
      end
      it "should create a blog" do
        expect { click_button "Create my Blog" }.to change(blog, :count).by(1)
      end
    end
  end

  describe "blog edit" do
    let(:blog) { FactoryGirl.create(:blog) }
    before do
      sign_in user
      visit editblog_path
    end

    describe "page" do
      it {should have_title("Edit your blog")}
      it {should have_title("Edit blog")}
    end
    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_title('error') }
    end
    describe "with valid information" do
      let(:new_title)  { "New Title" }
      let(:new_body) { "Body" }
      before do
        fill_in "title",         with: "test"
        fill_in "body",        with: "test"
        fill_in "time",     with: "now"
      end
      it {should have_title(new_title)}
      it { should have_selector('div.alert.alert-success') }
      specify { expect(user.reload.title).to  eq new_title }
      specify { expect(user.reload.body).to eq new_body }
    end
  end
end