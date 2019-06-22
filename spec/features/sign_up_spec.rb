# frozen_string_literal: true
# require './app.rb'

feature 'sign up for chitter' do
  scenario 'user enters name, username, email and password to sign up' do
    visit('/')
    expect(page).not_to have_content('Hi Bob, click to see your message board')
    expect(page).not_to have_selector(:button, 'to your messages...')
    click_button 'sign up'
    fill_in(:name, with: 'Bob')
    fill_in(:username, with: 'smallbadger')
    fill_in(:email, with: 'bobthebadger@hotmail.com')
    fill_in(:password, with: 'Badger123')
    click_button 'submit'
    expect(page).to have_content('Hi Bob, click to see your message board')
    expect(page).to have_selector(:button, 'to your messages...')
  end

  scenario 'user receives a confirmation once sign up is complete' do

  end
end
