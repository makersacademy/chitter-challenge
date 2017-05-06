require './app/app.rb'
require 'spec_helper'

feature 'Sign up' do
  scenario 'I want to sign up for Chitter' do
    visit '/sign_up'
    fill_in 'e-mail', with: 'eren@makersacademy.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Eren Jaeger'
    fill_in 'user name', with: 'kyojin'
    click_button 'Register'
  end
end
