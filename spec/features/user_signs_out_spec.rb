require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'user signs out' do

  before(:each) do
    create_user
  end

  scenario 'while being sign in' do
    sign_in('test@test.com', 'test')
    expect(page).to have_content('Welcome, test@test.com!')
    click_button 'Sign out'
    expect(page).to have_content('Good bye!')
    expect(page).not_to have_content('Welcome, test@test.com!')
  end

end