require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "Home page" do
    it "should have the h1 'Sample App'" do 
      get '/static_pages/home'
      expect(response.body).to include('<h1>Sample App</h1>')
    end

    it "should have the base title" do
      get '/static_pages/home'
      expect(response.body).to include('<title> Ruby on Rails Tutorial Sample App </title>')
    end

    it "should not have a custom page title" do
      get '/static_pages/home'
      expect(response.body).to_not include('<title> | Home </title>')
    end

    # it "should have the Title 'Home'" do
    #   get '/static_pages/home'
    #   expect(response.body).to include('<title>' + @base_title + ' | Home</title>')
    # end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do 
      get '/static_pages/help'
      expect(response.body).to include('<h1>Help</h1>')
    end

    it "should have the Title 'Help'" do 
      get '/static_pages/help'
      expect(response.body).to include('<title>' + @base_title + ' | Help</title>')
    end
  end

  describe "About page" do
    it "should have the h1 'About Us'" do 
      get '/static_pages/about'
      expect(response.body).to include('<h1>About Us</h1>')
    end

    it "should have the Title 'About Us'" do 
      get '/static_pages/about'
      expect(response.body).to include('<title>' + @base_title + ' | About Us</title>')
    end
  end

    describe "Contact page" do
    it "should have the h1 'Contact'" do 
      get '/static_pages/contact'
      expect(response.body).to include('<h1>Contact</h1>')
    end

    it "should have the Title 'Contact'" do 
      get '/static_pages/contact'
      expect(response.body).to include('<title>' + @base_title + ' | Contact</title>')
    end
  end

end
