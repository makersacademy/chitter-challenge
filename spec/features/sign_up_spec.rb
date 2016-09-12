require 'spec_helper'

feature 'user sign up' do
  scenario 'user can sign up' do
    sign_up
    expect(User.count).to eq 1
    expect(page).to have_content('Welcome, Erce Kal!')
  end

  scenario 'sign up fails if password does not match password confirmation' do
    visit '/'
    click_button('Sign up')
    fill_in :username, with: 'erce'
    fill_in :email, with: 'erce@erce.com'
    fill_in :name, with: 'Erce Kal'
    fill_in :password, with: '123456'
    fill_in :password_confirmation, with: '1111'
    click_button "Sign up"
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "sign up fails with an invalid email address" do
    visit '/'
    click_button('Sign up')
    fill_in :username, with: 'erce'
    fill_in :email, with: 'erce.com'
    fill_in :name, with: 'Erce Kal'
    fill_in :password, with: '123456'
    fill_in :password_confirmation, with: '123456'
    click_button "Sign up"
    expect(User.count).to eq 0
 end

end
