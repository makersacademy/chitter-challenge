require 'spec_helper'
require_relative 'helpers/user'

feature 'Feature - User Database' do

  before(:each) do
    User.create email: 'sanjsanj@hotmail.com',
                user_name: 'Sanjay Purswani',
                user_handle: 'sanjsanj'
    User.create email: 'bob@bob.com',
                user_name: 'Bob Smith',
                user_handle: 'bob'
  end

  after(:each) do
    User.each(&:destroy)
  end

  scenario 'lists all users' do
    visit '/users/list'
    expect(page).to have_content "@sanjsanj - Sanjay Purswani"
    expect(page).to have_content "@bob - Bob Smith"
  end

end
