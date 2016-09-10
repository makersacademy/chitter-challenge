require 'spec_helper'

feature 'User sign up' do
  scenario 'user can sign up with valid data' do
    sign_up
    expect(page).to have_content("Welcome, John Smith")
    expect(current_path).to eq '/messages'
  end

  scenario 'user cannot sign up with mismatching password' do
    sign_up(password_confirmation: 'Password2')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Password does not match the confirmation")
    expect(User.all.size).to eq 0
  end

  scenario 'user cannot sign up with the same username twice' do
    sign_up
    sign_up(email: 'chitter2@testdomain.com')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Username is already taken")
    expect(User.all.size).to eq 1
  end

  scenario 'user cannot sign up with no username' do
    sign_up(username: "")
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Username must not be blank")
    expect(User.all.size).to eq 0
  end

  scenario "user cannot add username with special char other than '_'" do
    sign_up(username: "+++++")
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Username has an invalid format")
    expect(User.all.size).to eq 0
  end

  scenario "user cannot add name with special char other than '_'" do
    sign_up(name: "+++")
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Name has an invalid format")
    expect(User.all.size).to eq 0
  end

  scenario 'user cannot sign up with no name' do
    sign_up(name: "")
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Name must not be blank")
    expect(User.all.size).to eq 0
  end

  scenario 'user cannot sign up with no email address' do
    sign_up(email: "")
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Email must not be blank")
    expect(User.all.size).to eq 0
  end

  scenario 'user cannot sign up with the same email address twice' do
    2.times {sign_up}
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Email is already taken")
    expect(User.all.size).to eq 1
  end

  scenario 'user cannot sign up with invalid email address' do
    sign_up(email: "user")
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Email has an invalid format")
    expect(User.all.size).to eq 0
  end
end

feature 'User log in' do
  scenario 'user can sign in with valid credentials and see a welcome message' do
    sign_up
    log_in
    expect(page).to have_content("Welcome, John Smith")
    expect(current_path).to eq '/messages'
  end

  scenario 'user cannot sign in with wrong email and/or password' do
    sign_up
    log_in(password: 'Password22')
    expect(page).to have_content("Email or password is not correct")
    expect(current_path).to eq '/sessions/new'
  end
end

feature 'User log out' do

end
