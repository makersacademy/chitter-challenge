require 'spec_helper'
require 'helpers/user_helpers'

feature 'The user wants to see all public peeps' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John Smith',
                username: 'test_user1')
    User.create(email: 'newtest@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'Jack Jones',
                username: 'new_user1')
    login('test_user1', '123')
  end

  scenario 'whilst logged in' do
    create_peep "Hello world!"
    create_peep "It's me again!"
    expect(page).to have_content "John Smith (test_user1) said: Hello world!"
    expect(page).to have_content "John Smith (test_user1) said: It's me again!"
  end

  scenario 'from all users whilst logged in' do
    create_peep 'Hello this is John Smith!'
    click_button 'Logout'
    login 'new_user1', '123'
    create_peep "Hello this is Jack Jones!"
    expect(page).to have_content "John Smith (test_user1) said: Hello this is John Smith!"
    expect(page).to have_content "Jack Jones (new_user1) said: Hello this is Jack Jones!"
  end

  scenario 'when not logged in' do
    create_peep "Hello world!"
    create_peep "It's me again!"
    click_button 'Logout'
    expect(page).to have_content "John Smith (test_user1) said: Hello world!"
    expect(page).to have_content "John Smith (test_user1) said: It's me again!"
    expect(page).to have_content "Please login here"
  end
end

feature 'A user wants to read a private peep' do
    before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John Smith',
                username: 'test_user1')
    User.create(email: 'newtest@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'Jack Jones',
                username: 'new_user1')
    login('test_user1', '123')
  end

  xscenario 'from another user whilst logged in' do
    login('new_user1', '123')
    expect(page).not_to have_content 'Hi Jack!'
    click_button 'Private Peeps'
    expect(current_path).to eq '/main/private'
    expect(page).to have_content 'Hi Jack! from test_user1 (John Smith)'
  end
end
