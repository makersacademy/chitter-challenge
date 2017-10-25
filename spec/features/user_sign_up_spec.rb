require_relative 'spec_helper'

feature 'User sign up' do

  scenario 'signing up creates a new User in DB' do
    expect { sign_up_as_mormolis }.to change(User, :count).by(1)
  end

  scenario 'user signs up succesfuly' do
    sign_up_as_mormolis
    expect(page).to have_content "Please log in :)"
  end

  scenario 'username already exists' do
    sign_up_as_mormolis

    visit('/signup')
    fill_in :first_name, with: 'George2'
    fill_in :last_name, with: 'Lamprakis2'
    fill_in :username, with: 'mormolis'
    fill_in :email, with: 'mormol@example.com'
    fill_in :password, with: '121212'
    fill_in :confirmation, with: '121212'
    click_button 'Sign up'
    expect(page).to have_content "Username or Email already in use"
  end

  scenario 'email already exists' do
    sign_up_as_mormolis

    visit('/signup')
    fill_in :first_name, with: 'George2'
    fill_in :last_name, with: 'Lamprakis2'
    fill_in :username, with: 'mormolis2'
    fill_in :email, with: 'mormolis@example.com'
    fill_in :password, with: '121212'
    fill_in :confirmation, with: '121212'
    click_button 'Sign up'
    expect(page).to have_content "Username or Email already in use"
  end  
  
  scenario 'password does not match' do
    sign_up_as_mormolis

    visit('/signup')
    fill_in :first_name, with: 'George2'
    fill_in :last_name, with: 'Lamprakis2'
    fill_in :username, with: 'mormolis2'
    fill_in :email, with: 'mormolis2@example.com'
    fill_in :password, with: '121212'
    fill_in :confirmation, with: '212121'
    click_button 'Sign up'
    expect(page).to have_content "Not matching passwords! Please try again!"
  end 
end

feature 'User can log off' do
  scenario 'User logs off and sent to log in page' do
    sign_up_as_mormolis
    log_in_as_mormolis

    click_link 'log off'
    expect(current_path).to eq '/login'
  end
  scenario 'but it can still see posted peeps' do
    sign_up_as_mormolis
    log_in_as_mormolis

    click_link 'log off'
    visit('/peeps')
    expect(page).to have_content "Latest Peeps"
  end
end
