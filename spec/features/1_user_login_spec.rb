require "user"
require "./spec/features/0_web_helper.rb"

feature 'Feature: Login' do
  scenario 'a valid user can log in with correct password' do
    sign_in
    expect(current_path).to eq '/message'
    expect(page).to have_content 'Welcome, Elvis'
  end

  scenario 'a valid user cannot log in with incorrect password' do
    User.create(name: "Elvis2", email: 'test@example.com', password: 'password', receive_email: 'y')
    visit '/user'
    fill_in :name, with: 'Elvis2'
    fill_in :password, with: 'password123'
    click_button('submit')
    expect(current_path).to eq '/user'
    expect(page).to have_content 'Incorrect password'
  end

  scenario 'an invalid user cannot log in at all' do
    User.create(name: "Elvis3", email: 'test@example.com', password: 'password', receive_email: 'y')
    visit '/user'
    fill_in :name, with: 'user'
    fill_in :password, with: 'password'
    click_button('submit')
    expect(current_path).to eq '/user'
    expect(page).to have_content 'No such user'
  end

end
