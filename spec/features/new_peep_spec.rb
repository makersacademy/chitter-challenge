require 'spec_helper'
require 'helpers/user_helpers'

feature 'A logged in user wants to' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John Smith',
                username: 'test_user1')

    login('test_user1', '123')
  end

  scenario 'create a new peep' do
    expect(current_path).to eq '/main'
    expect(page).to have_content 'Post a peep here'
    fill_in 'message', with: 'Hello world!'
    click_button 'Peep'
    expect(page).to have_content 'Hello world!'
  end
end