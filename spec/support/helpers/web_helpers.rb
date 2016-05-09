def visual_debug
  require 'capybara/dsl'
  Capybara.default_driver = :selenium
  include Capybara::DSL
end

def signup_invalid_email
  visit('/signup')
  fill_in 'username', with: 'cooluser_123'
  fill_in 'password', with: 'secretpassword'
    fill_in 'email', with: 'cool2me.com'
  fill_in 'password_confirmation', with: 'secretpassword'
  click_button 'Sign Up'
end

def signup_wrong_confirmation
  visit('/signup')
  fill_in 'username', with: 'cooluser_123'
  fill_in 'email', with: 'cool@me.com'
  fill_in 'password', with: 'secretpassword'
  fill_in 'password_confirmation', with: 'wrongthing'
  click_button 'Sign Up'
end

def signup
  visit('/signup')
  fill_in 'username', with: 'cooluser_123'
  fill_in 'email', with: 'cool@me.com'
  fill_in 'password', with: 'secretpassword'
  fill_in 'password_confirmation', with: 'secretpassword'
  click_button 'Sign Up'
end

def signup_blank_email
  visit('/signup')
  fill_in 'username', with: 'cooluser_123'
  fill_in 'password', with: 'secretpassword'
    fill_in 'email', with: nil
  fill_in 'password_confirmation', with: 'secretpassword'
  click_button 'Sign Up'
end
