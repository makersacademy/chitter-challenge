require "user"
require "./spec/features/0_web_helper.rb"

feature 'Feature: Logout' do
  scenario 'a valid user can log out if logged in' do
    sign_in
    click_link('Logout')
    expect(current_path).to eq '/message'
    expect(page).to have_content 'Logout successful'
  end

  scenario 'a valid user cannot post anything after logout' do
    sign_in
    click_link('Logout')
    expect(page).to have_no_button('submit')
    expect(page).to have_link 'Login'
  end

  scenario 'a valid user cannot log out if NOT logged in' do
    User.create(name: "Elvis3", email: 'test@example.com', password: 'password', receive_email: 'y')
    visit '/message'
    expect(page).to have_no_link 'Logout'
  end

end
