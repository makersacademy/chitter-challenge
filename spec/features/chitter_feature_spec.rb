require './app'
require 'orderly'
require 'time'

feature 'posting a message' do
  scenario 'user can post a message to chitter' do
    visit('/')
    fill_in 'message', with: "I love Sinatra"
    click_button 'Submit'
    visit('/messages')
    expect(page).to have_content("I love Sinatra")

  end
end

feature 'messages are arranged' do
  scenario 'user can see all messages in reverse chronological order' do
    visit('/')
    fill_in 'message', with: "I love Sinatra"
    click_button 'Submit'
    visit('/')
    fill_in 'message', with: "I love beer"
    click_button 'Submit'
    visit('/messages')
    expect("I love beer").to appear_before("I love Sinatra")

  end
end

feature 'messages get a time stamp' do
  scenario 'User can see the time at which message was posted' do
    visit('/')
    fill_in 'message', with: "I love Sinatra"
    click_button 'Submit'
    visit('/messages')
    expect(page).to have_content("I love Sinatra #{Time_Calculation.calculation}")

  end
end
