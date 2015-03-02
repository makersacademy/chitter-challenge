require 'spec_helper'

feature 'User signs up' do

  scenario 'When visiting the site for the first time' do

    expect{sign_up}.to change(ChatterUser, :count).by 1
    expect(page).to have_content "Welcome, Erik."
    expect(ChatterUser.first.email).to eq "test@tester.com"
  end

  def sign_up

    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, with: 'Erik'
    fill_in :email, with: "test@tester.com"
    click_button "Sign Up"
  end


end