require 'spec_helper'
require './app/app.rb'
require './spec/features/web_helper.rb'

feature "Logging in" do
  let!(:user) do
    User.create(email: 'louisa@example.com',
                username: 'louisaspicer',
                password: 'greatpassword',
                password_confirmation: 'greatpassword')
    end

  scenario "Login with correct username and password" do
    login
    expect(page).to have_content("Welcome louisaspicer!")
  end

end
