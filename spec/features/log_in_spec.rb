require 'spec_helper'

feature 'Log in' do

  before(:each) do
    sign_up('abigail', 'abi@test.com', 'abimcp', 'password123', 'password123')
    Capybara.reset_sessions!
  end

  scenario 'a user can log in' do
    log_in('abi@test.com', 'password123')
    expect(page).to have_content 'Welcome, Abigail!'
    expect(current_path).to eq '/peeps'
  end

  scenario 'a user must enter the correct password' do
    log_in('abi@test.com', 'password456')
    expect(page).to have_content 'Sorry, incorrect email or password'
    expect(current_path).to eq '/sessions/new'
  end

end
