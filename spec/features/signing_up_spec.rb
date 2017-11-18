require 'capybara/rspec'
require './models/user.rb'

feature 'Signing up with email, password, name and username' do
  scenario 'When I get to the chitter homepage I want to be able to sign up' do
    visit '/'
    expect(page).to have_button 'Sign up!'
  end
  scenario 'When I click sign up I want to see a form to fill in my information' do
    visit '/'
    click_button 'Sign up!'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Password:'
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Username:'
  end
end
