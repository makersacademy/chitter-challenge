require 'spec_helper'
require './app/models/user.rb'
require 'web_helper'

RSpec.feature "User can log out " do
  scenario "after signing in" do
    sign_up
    click_button 'sign out'
    expect(page).to have_content "Welcome, stranger"
    expect(page).not_to have_content('Welcome Agatina')
  end

end
