require 'spec_helper'
require './app/models/user.rb'


RSpec.feature "No login" do
  scenario "User is welcomed" do
    visit '/'
    expect(page).to have_content('Welcome, stranger')
  end

  scenario "User can sign in" do
    visit '/'
    expect(page).to have_button('sign in')
  end


  scenario "User can sign up" do
    visit '/'
    expect(page).to have_button('sign up')
  end
end
