require 'spec_helper'
require './app/models/user.rb'


RSpec.feature "No login" do
  scenario "User is welcomed" do
    visit '/'
    expect(page).to have_content('Welcome, stranger')
    expect(page).to have_button('sign in')
    expect(page).to have_button('sign up')
  end


  scenario "User can see the messages without signing - in" do
    sign_up
    fill_in 'text',   with: 'Hello world'
    click_button 'Post a peep'
    click_button "sign out"
    expect(page).to have_content('Welcome, stranger')
    expect(page).to have_content('Hello world')
  end
end
