require 'spec_helper'

feature 'I want to sign up for Chitter' do
  scenario 'Allow user to create a Chitter account' do
    User.create(name: "Samuel Russell Hampden Joseph", username: "tansaku", email: "sam@makersacademy.com", password: "s3cr3t", password_confirmation: "s3cr3t")
    expect { sign_up }.to change(User, :count).by(1)
    # expect(current_path).to eq '/home'
    expect(page).to have_content("Welcome tansaku")
    expect(User.first.email).to eq("sam@makersacademy.com")
  end

  # def sign_up(name: "Samuel Russell Hampden Joseph",
  #           username: "tansaku",
  #           email: "sam@makersacademy.com",
  #           password: "s3cr3t",
  #           password_confirmation: "s3cr3t")
  #   visit "/users/new"
  #   fill_in :name, with: name
  #   fill_in :email, with: email
  #   fill_in :password, with: password
  #   fill_in :password_confirmation, with: password_confirmation
  #   click_button "Submit"
  # end
end
