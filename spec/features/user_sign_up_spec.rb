require 'spec_helper'

feature 'user sign up' do

  scenario 'as a new user I can sign up' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome, darth")
    expect(User.first.user_name).to eq("darth")
  end

  scenario 'will not allow user to sign up if passwords are mismatched' do
    expect{ sign_up_with_mismatched_password }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
    expect(current_path).to eq('/users')
  end

  scenario 'will not allow user to sign up without an email address' do
    visit '/users/new'
    fill_in :email, with: nil
    click_button 'sign up'
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'will not allow user to sign up without a name' do
    visit '/users/new'
    fill_in :name, with: nil
    click_button 'sign up'
    expect(current_path).to eq '/users'
    expect(page).to have_content('Name must not be blank')
  end

  scenario 'will not allow user to sign up without a user name' do
    visit '/users/new'
    fill_in :user_name, with: nil
    click_button 'sign up'
    expect(current_path).to eq '/users'
    expect(page).to have_content('User name must not be blank')
  end

  scenario 'will not allow a user to sign up with an invalid email' do
    visit '/users/new'
    fill_in :email, with: 'vader@deathstar'
    expect{ click_button 'sign up' }.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'will not allow user to sign up with an in use email address' do
    sign_up
    visit '/users/new'
    fill_in :email, with: 'database_guru@gmail.com'
    click_button 'sign up'
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end

  scenario 'will not allow user to sign up with an in use user name' do
    sign_up
    visit '/users/new'
    fill_in :user_name, with: 'darth'
    click_button 'sign up'
    expect(current_path).to eq '/users'
    expect(page).to have_content('User name is already taken')
  end
end
