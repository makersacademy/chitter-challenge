require 'spec_helper'

feature "Signing up" do
  scenario "A user signs up and increases the user count rby one" do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content('Welcome, James!')
  end

  scenario 'a user can only sign up once' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
  end
end
