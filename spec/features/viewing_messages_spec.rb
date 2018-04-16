require 'pg'
require 'orderly'
require_relative './web_helpers.rb'

feature 'A user can view messages in reverse chronological order', type: :feature do
  scenario 'A user views the message log' do
    add_user
    add_messages
    visit '/'
    click_button 'view messages'
    expect('Good bye!').to appear_before('Random announcement')
    expect('Random announcement').to appear_before('Hello everyone!')
  end
end
