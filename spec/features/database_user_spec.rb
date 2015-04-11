require 'spec_helper'
require_relative 'helpers/user'

feature 'Feature - User Database' do

  before(:each) do
    sign_up
    sign_up 'bob@bob.com', 'passw', 'passw', 'Bob Smith', 'bob'
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
