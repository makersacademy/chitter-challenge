require 'spec_helper'
require 'helpers/user_helpers'

feature 'The user wants to see all public peeps' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John',
                username: 'test_user1')
    User.create(email: 'newtest@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'Jack',
                username: 'new_user1')
    login('test_user1', '123')
  end

  scenario 'whilst logged in' do
    create_peep "Hello world!"
    create_peep "It's me again!"
    expect(page).to have_content "Hello world!"
    expect(page).to have_content "It's me again!"
  end

  scenario 'from all users whilst logged in' do
    create_peep 'Hello this is John!'
    click_button 'Logout'
    login 'new_user1', '123'
    create_peep "Hello this is Jack!"
    expect(page).to have_content "Hello this is John!"
    expect(page).to have_content "Hello this is Jack!"
  end

  scenario 'when not logged in' do
    create_peep "Hello world!"
    create_peep "It's me again!"
    click_button 'Logout'
    expect(current_path).to eq '/'
    expect(page).to have_content "Hello world!"
    expect(page).to have_content "It's me again!"
    expect(page).to have_content "Please login here"
  end
end

feature 'A user wants to read a private peep' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John',
                username: 'test_user1')
    User.create(email: 'newtest@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'Jack',
                username: 'new_user1')
    login('test_user1', '123')
  end

  scenario 'from another user whilst logged in' do
    select 'Jack', from: 'maker'
    click_button 'Go'
    expect(current_path).to eq '/main/private/person'
    create_peep 'Hi Jack!'
    click_button 'Logout'
    login('new_user1', '123')
    expect(page).not_to have_content 'Hi Jack!'
    select 'John', from: 'maker'
    click_button 'Go'
    expect(page).to have_content 'Current messages with John'
    expect(page).to have_content 'Hi Jack!'
  end
end
