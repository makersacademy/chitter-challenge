require 'spec_helper'
require 'helpers/user_helpers'

feature 'A logged in user wants to write' do

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

  scenario 'a new public peep' do
    expect(current_path).to eq '/main'
    expect(page).to have_content 'Post a peep here'
    create_peep 'Hello world!'
    expect(page).to have_content 'Hello world!'
  end

  scenario 'a private peep to another user' do
    expect(current_path).to eq '/main'
    select 'Jack Jones', from: 'makers'
    click_button 'Private Peeps'
    expect(current_path).to eq '/main/private'
    expect(page).to have_content 'Write a private peep to Jack here'
    create_peep 'Hi Jack!'
    expect(page).to have_content 'John Smith said: Hi Jack!'
  end

end