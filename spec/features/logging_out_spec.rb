require 'spec_helper'
require './app/app.rb'
require './spec/features/web_helper.rb'

feature "Logging out" do

  before(:each) do
    User.create(name: 'Louisa Spicer',
                username: 'louisa',
                email: 'louisa@example.com',
                password: 'allthepasswords',
                password_confirmation: 'allthepasswords')
  end

  scenario "User should be able to log out while signed in" do
    login(username: 'louisa', password: 'allthepasswords')
    click_button("Logout")
    expect(page).not_to have_content('Welcome Louisa Spicer!')
    expect(page).to have_button('Login')
  end

end
