require 'rails_helper'
require './spec/support/utilities.rb'

RSpec.describe "StaticPages", type: :request do

  subject { response.body }

  describe "Home page" do
    before { get root_path }
    it { should include('<h1>Welcome to the Sample App</h1>') }
    it { should include("<title>#{full_title('')}</title>") }
    it { should_not include("<title>#{full_title('Home')}</title>") }
  end

  describe "Help page" do
    before { get help_path }
    it { should include('<h1>Help</h1>') }
    it { should include("<title>#{full_title('Help')}</title>") }
  end

  describe "About page" do
    before { get about_path }
    it { should include('h1>About Us</h1>') }
    it { should include("<title>#{full_title('About Us')}</title>") }
  end

  describe "Contact page" do
    before { get contact_path }
    it { should include('<h1>Contact</h1>') }
    it { should include("<title>#{full_title('Contact')}</title>") }
  end

end
