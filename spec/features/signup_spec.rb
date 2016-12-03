require 'spec_helper'
require './app/app.rb'
require './spec/features/web_helper.rb'

feature "Signing up" do
  scenario "Should allow user to create a Chitter account" do
    sign_up
    expect(page).to have_content 'Welcome louisaspicer!'
  end

  scenario "Should not save user details if passwords don't match" do
    expect{sign_up(confirm: 'wrongpassword')}.not_to change(User, :count)
  end

  scenario "Should inform the user passwords do not match" do
    expect{sign_up(confirm: 'wrongpassword')}.not_to change(User, :count)
    expect(current_path).to eq('/')
    expect(page).to have_content("Your password and confirmation password do not match")
  end
end
