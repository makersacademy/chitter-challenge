require_relative './web_helper'

feature 'Sign up to chitter' do

  scenario 'enter your details' do
    visit('/sign_up')
    sign_up_one
    expect(page).to have_content('Sign up successful')
  end

  scenario 'email already in use message if email already exists' do
    visit('/sign_up')
    sign_up_one
    click_button('SIGN UP')
    sign_up_two
    expect(page).to have_content('Email address already in use')

  end

  scenario 'user name already in use message if user name already exists' do
    visit('/sign_up')
    sign_up_one
    click_button('SIGN UP')
    sign_up_three
    expect(page).to have_content('User name already in use')
  end
end
