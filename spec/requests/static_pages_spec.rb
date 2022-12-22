require 'rails_helper'
# require './spec/support/utilities.rb'
include ApplicationHelper

RSpec.describe "StaticPages", type: :request do

  subject { response.body }

  shared_examples_for "all static pages" do
    it { should include("<h1>#{heading}</h1>") }
    it { should include("<title>#{full_title(page_title)}</title>") }
  end

  describe "Home page" do
    before { get root_path }
    let(:heading) { 'Welcome to the Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    it { should_not include("<title>#{full_title('Home')}</title>") }
  end

  describe "Help page" do
    before { get help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { get about_path }
    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { get contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    # visit root_path
    # find('About')
    # click_link "About"
    # page.should have_selector 'title', text: full_title('About Us')
    # click_link "Help"
    # page.should # fill in
    # click link "Contact"  
    # page.should # fill in
    # click link "Home"
    # click link "Sign up now!"
    # page.should # fill in
    # click link "sample app"
    # page.should # fill in
  end
end

RSpec.describe "StaticPages", type: :system do
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    expect(page).to have_title(full_title(''))
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "Sample app"
    expect(page).to have_title(full_title(''))
  end
end
