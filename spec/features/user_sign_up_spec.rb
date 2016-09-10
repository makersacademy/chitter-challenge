require 'spec_helper'

feature 'user sign up' do

  scenario 'as a new user I can sign up' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome, darth")
    expect(User.first.user_name).to eq("darth")
  end
end
