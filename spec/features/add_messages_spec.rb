require_relative '../spec_helper'
require 'capybara'

feature 'able to add a message' do 
  scenario 'it will add a message to index' do 
    signup
    visit '/messages/new' 
    fill_in('content', with: 'this is first message')
    click_button('Submit')

    expect(page).to have_content('this is first message')
  end 

end
