#require 'spec_helper'

feature "Signing up" do
  scenario "when user signs up user count increases by one" do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content('Welcome, James!')
  end

  scenario 'a user can only sign up once' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
  end
end
