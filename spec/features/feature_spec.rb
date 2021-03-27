require './app.rb'
require 'spec_helper'

feature 'Chitter homepage' do
  scenario 'homepage has a chitter header' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end

feature 'sign up to chitter' do
  scenario 'a user can click a link to sign up' do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'user can fill in user information to sign up' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'name', with: 'Lou Reade'
    fill_in 'username', with: 'loushark'
    fill_in 'email', with: 'loushark@gmail.com'
    fill_in 'password', with: 'Sharks@reC00l'
    click_button 'sign_up'
    expect(page).to have_content 'you are signed in'
  end
end

feature 'login' do
  scenario ' a user can click a link to login' do
    visit '/'
    click_link 'Login'
    expect(page).to have_content 'Login to Chitter'
  end

  scenario 'user can fill in user information to log in' do
    visit '/'
    click_link 'Login'
    fill_in 'username', with: 'loushark'
    fill_in 'email', with: 'loushark@gmail.com'
    click_button 'login'
    expect(page).to have_content 'you are signed in'
  end
end

feature 'peeps page' do
  scenario 'user can view all peeps' do
    fill_test_database
    visit '/peeps'
    expect(page).to have_content 'Peeps'
    expect(page).to have_content 'I have eaten way too many brownies! Help!'
  end
end
