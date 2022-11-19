require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "Home page" do
    it "should have the h1 'Sample App'" do 
      get '/static_pages/home'
      expect(response.body).to include('<h1>Sample App</h1>')
    end

    it "should have the Title 'Home'" do 
      get '/static_pages/home'
      expect(response.body).to include('<title>Ruby on Rails Tutorial Sample App | Home</title>')
    end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do 
      get '/static_pages/help'
      expect(response.body).to include('<h1>Help</h1>')
    end

    it "should have the Title 'Help'" do 
      get '/static_pages/help'
      expect(response.body).to include('<title>Ruby on Rails Tutorial Sample App | Help</title>')
    end
  end

   describe "About page" do
    it "should have the h1 'About Us'" do 
      get '/static_pages/about'
      expect(response.body).to include('<h1>About Us</h1>')
    end

    it "should have the Title 'About Us'" do 
      get '/static_pages/about'
      expect(response.body).to include('<title>Ruby on Rails Tutorial Sample App | About Us</title>')
    end
  end

end
