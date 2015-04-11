require 'spec_helper'
require_relative 'helpers/user'

feature 'Feature - User Database' do

  before(:each) do
    sign_up
  end

  after(:each) do
    User.each(&:destroy)
  end

  # scenario 'lists all users' do
  #   visit '/'
  #   expect(page).to have_content "My first peep by @sanjsanj (Sanjay Purswani)"
  #   expect(page).to have_content "Bob's first peep by @bob (Bob Smith)"
  # end

end
