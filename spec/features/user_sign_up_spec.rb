require 'spec_helper'

feature 'user sign up' do

  scenario 'as a new user I can sign up with an email and password' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome, database_guru")
    expect(User.first.email).to eq("database_guru@gmail.com")
  end
end
