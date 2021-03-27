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
    sign_up_fill_and_submit
    expect(page).to have_content 'you are signed in'
  end

  scenario 'when signed in username is shown on peeps page' do
    sign_up_fill_and_submit
    expect(page).to have_content 'signed in as loushark'
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

feature 'logout' do
  scenario 'user can click a link to logout' do
    visit '/peeps'
    expect(page).to have_link 'Logout'
  end

  scenario 'user is logged out' do
    visit '/peeps'
    click_link 'Logout'
    expect(page).to have_link 'Sign Up'
    expect(page).to have_link 'Login'
    expect(page).to have_content 'Chitter'
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

feature 'add a peep' do
  scenario 'user can click a link to add a peep' do
    visit '/peeps'
    expect(page).to have_link 'Add Peep'
  end

  scenario 'user can write a new peep and submit it to the peeps page' do
    visit '/peeps'
    click_link 'Add Peep'
    fill_in 'new_peep', with: 'I hope it snows tomorrow. I want to build a snowman named Greg'
    click_button 'Add Peep'
    expect(page).to have_content 'I hope it snows tomorrow. I want to build a snowman named Greg'
  end
end
