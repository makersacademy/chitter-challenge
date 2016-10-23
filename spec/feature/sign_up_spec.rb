require_relative '../spec_helper'

feature 'signing up' do
  scenario 'a user can sign up' do
    visit '/'
    click_link 'Sign up'
    fill_in('name', with: 'Laszlo')
    fill_in('user_name', with: 'laszlobogacsi')
    fill_in('email', with: 'bogacsi.laszlo@gmail.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect{ click_button("Sign Up!") }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Laszlo!')
  end
  scenario "a user can't sign up with missmatching passwords" do
    visit '/'
    click_link 'Sign up'
    fill_in('name', with: 'Laszlo')
    fill_in('user_name', with: 'laszlobogacsi')
    fill_in('email', with: 'bogacsi.laszlo@gmail.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'wrongpassword')
    expect{ click_button("Sign Up!") }.to change(User, :count).by(0)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "a user can't sign up if a resuired information is missing" do
    visit '/'
    click_link 'Sign up'
    fill_in('name', with: '')
    fill_in('user_name', with: ' ')
    fill_in('email', with: '')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect{ click_button("Sign Up!") }.to change(User, :count).by(0)
    expect(page).to have_content('Name must not be blank User name must not be blank Email must not be blank')
  end

  scenario "a user can't sign up if the email has incorrect format" do
    visit '/'
    click_link 'Sign up'
    fill_in('name', with: 'Laszlo')
    fill_in('user_name', with: 'laszlobogacsi')
    fill_in('email', with: '')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect{ click_button("Sign Up!") }.to change(User, :count).by(0)
    expect(page).to have_content('Email must not be blank')
  end
end
