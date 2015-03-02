require 'spec_helper'

feature 'User signs up' do

  scenario 'When visiting the site for the first time' do
    expect{sign_up}.to change(ChatterUser, :count).by 1
    expect(page).to have_content "Welcome, Erik."
    expect(ChatterUser.first.email).to eq "test@tester.com"
  end

  scenario 'The passwords dont match' do
    expect{sign_up("pass","mismatch")}.to change(ChatterUser, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content "Passwords did not match."
  end




  def sign_up(password="QWERTY!1759", confirmation="QWERTY!1759")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, with: 'Erik'
    fill_in :email, with: 'test@tester.com'
    fill_in :password, with: password
    fill_in :password_confirmation, with: confirmation
    click_button "Sign Up"
  end

end

