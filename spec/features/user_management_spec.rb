require 'spec_helper'

feature 'User signs up' do
  scenario 'as a new user' do
    visit('/')
    click_link('Sign up')
    expect(page).to have_content('Hey testyboi, Welcome to Chitter')
    expect{ sign_up }.to change(User, :count).by(1)
  end

  def sign_up(name = 'Test Testeringson', 
              email = 'test@test.com',
              username = 'testyboi',
              password = 'testy')
    visit('/users/new')
    fill_in('name', :with => name)
    fill_in('email', :with => email)
    fill_in('username', :with => username)
    fill_in('password', :with => password)
    click_button('Create Account')
  end
end