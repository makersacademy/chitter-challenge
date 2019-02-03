require './app'
require 'orderly'
require 'time'
require_relative 'web_helper'

feature 'posting a message' do
  scenario 'user can post a message to chitter' do
    messages_log
    expect(page).to have_content("I love Sinatra")
  end
end

feature 'messages are arranged' do
  scenario 'user can see all messages in reverse chronological order' do
    visit('/create')
    fill_in 'message', with: "I love beer"
    click_button 'Submit'
    messages_log
    expect("I love Sinatra").to appear_before("I love beer")

  end
end

feature 'messages get a time stamp' do
  scenario 'user can see the time at which message was posted' do
    messages_log
    expect(page).to have_content("@ #{Time_Calculation.calculation} ~ I love Sinatra")
  end
end

feature 'messages get a user name' do
  scenario 'user can see his name displayed by the message' do
    visit('/')
    fill_in 'user_name', with: 'Kasia'
    fill_in 'your_email', with: 'Kasia@o2.pl'
    fill_in 'your_password', with: 'password1'
    click_button 'Sign up'
    messages_log
    expect(page).to have_content("Kasia")
  end
end
