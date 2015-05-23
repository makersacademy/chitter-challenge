require 'spec_helper'
require 'helpers/user_helpers'

feature 'A logged in user wants to create' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John Smith',
                username: 'test_user1')

  end

  scenario 'a new peep' do
    login('test_user1', '123')
    expect(current_path).to eq '/main'
    expect(page).to have_content 'Post a peep here'
    create_peep 'Hello world!'
    expect(page).to have_content 'Hello world!'
  end

end

feature 'The user wants to see' do

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

  scenario 'all peeps whilst logged in' do
    create_peep "Hello world!"
    create_peep "It's me again!"
    expect(page).to have_content "test_user1 said: Hello world!"
    expect(page).to have_content "test_user1 said: It's me again!"
  end

  scenario 'all peeps from all users whilst logged in' do
    create_peep 'Hello this is John Smith!'
    click_button 'Logout'
    login 'new_user1', '123'
    create_peep "Hello this is Jack Jones!"
    expect(page).to have_content "test_user1 said: Hello this is John Smith!"
    expect(page).to have_content "new_user1 said: Hello this is Jack Jones!"
  end

  scenario 'all peeps when not logged in' do
    create_peep "Hello world!"
    create_peep "It's me again!"
    click_button 'Logout'
    expect(page).to have_content "test_user1 said: Hello world!"
    expect(page).to have_content "test_user1 said: It's me again!"
    expect(page).to have_content "Please login here"
  end
end