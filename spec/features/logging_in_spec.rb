require 'spec_helper'
require './app/app.rb'
require './spec/features/web_helper.rb'

feature "Logging in" do

  before(:each) do
    User.create(name: 'Louisa Spicer',
                email: 'louisa@example.com',
                username: 'louisaspicer',
                password: 'greatpassword',
                password_confirmation: 'greatpassword')
    end

  scenario "Login with correct username and password" do
    login
    expect(page).to have_content("Welcome Louisa Spicer!")
  end

end
