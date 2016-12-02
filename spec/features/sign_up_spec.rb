require 'spec_helper.rb'

feature 'Sign Up' do

  scenario 'sign up to Chitter' do
    visit '/'
    fill_in :email, with 'test@123.com'
    fill_in :handle, with '@test_123'
    fill_in :password, with 'password123'
    click_button "Sign Up"
  end
end
