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
end
