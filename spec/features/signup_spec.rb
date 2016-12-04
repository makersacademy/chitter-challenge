require 'spec_helper'
require './app/app.rb'
require './spec/features/web_helper.rb'

feature "Signing up" do
  scenario "Should allow user to create a Chitter account" do
    sign_up
    expect(page).to have_content 'Welcome Louisa Spicer!'
  end

  scenario "Should not save user details if passwords don't match" do
    expect{sign_up(confirm: 'wrongpassword')}.not_to change(User, :count)
  end

  scenario "Should inform the user passwords do not match" do
    expect{sign_up(confirm: 'wrongpassword')}.not_to change(User, :count)
    expect(current_path).to eq('/')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "Unable to sign up without an email address" do
    expect{sign_up(email: nil)}.not_to change(User, :count)
    expect(current_path).to eq('/')
  end

  scenario "Unable to sign up with a invalid email address" do
    expect{sign_up(email: 'silly@email')}.not_to change(User, :count)
  end

  scenario "Unable to sign up if email address is already registered" do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
