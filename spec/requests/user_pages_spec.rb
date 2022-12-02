# require 'rails_helper'

# RSpec.describe "UserPages", type: :request do
#   describe "GET /user_pages" do
#     it "works! (now write some real specs)" do
#       get user_pages_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
require 'spec_helper'
require './spec/support/utilities.rb'

RSpec.describe "UserPages", type: :request do
  subject { response.body }
  describe "signup page" do
    before { get users_new_path }
    it { should include('<h1>Sign up</h1>') }
    it { should include("<title>#{full_title('Sign up')}</title>") }
  end
end