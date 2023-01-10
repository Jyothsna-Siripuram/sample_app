require 'rails_helper'

# RSpec.describe "UserPages", type: :request do
#   describe "GET /user_pages" do
#     it "works! (now write some real specs)" do
#       get user_pages_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
require 'spec_helper'
# include ApplicationHelper
require './spec/support/utilities.rb'

RSpec.describe "UserPages", type: :request do
  subject { response.body }

  describe "signup page" do
    let(:user) { FactoryGirl.create(:user) }
    before { get new_user_path }
    it { should include('<h1>Sign up</h1>') }
    it { should include("<title>#{full_title('Sign up')}</title>") }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { get user_path(user) }
    it { should include("<h1>#{user.name}</h1>") }
    it { should include("<title>#{full_title(user.name)}</title>") }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }
        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }
        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end