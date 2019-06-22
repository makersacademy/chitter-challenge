# frozen_string_literal: true
# require './app.rb'

feature 'sign up for chitter' do
  scenario 'user enters name, username, email and password to sign up' do
    visit('/')
    expect(page).not_to have_content('Hi Bob, click to see your message board')
    expect(page).not_to have_selector(:button, 'to your messages...')
    sign_up_bob
    expect(page).to have_content('Hi Bob, click to see your message board')
    expect(page).to have_selector(:button, 'to your messages...')
  end

  scenario 'user receives a confirmation once sign up is complete' do

  end
end
