require 'spec_helper'

feature Chitter do

  scenario 'home page displays title' do
    visit '/'
    expect(page).to have_text 'Welcome to Chitter'
  end

  scenario 'user can go to sign up page from index' do
    visit '/'
    click_button 'Sign up'
  end

  scenario 'Sign up button redirects to sign up page' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_field(:Email)
  end

end
