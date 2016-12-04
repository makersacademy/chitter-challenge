require 'spec_helper'
require './app/app.rb'
require './spec/features/web_helper.rb'

feature "Logging in" do


  scenario "Login with correct username and password" do
      User.create(name: 'Louisa Spicer',
                  email: 'louisa@example.com',
                  username: 'louisaspicer',
                  password: 'greatpassword',
                  password_confirmation: 'greatpassword')
    login
    expect(page).to have_content("Welcome Louisa Spicer!")
  end

end
