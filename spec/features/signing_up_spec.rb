require './spec/spec_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up' do

  scenario "so I can sign up to Chitter" do
    sign_in
    expect(page).to have_content('Welcome m1k3')
  end

  scenario 'increases the user count' do
    expect{sign_up}.to change{User.count}.by(1)
  end

  scenario 'signing up without filling in all boxes' do
    expect{sign_up_no_details}.not_to change{User.count}
  end

  scenario 'signing up with a bad email adress' do
    expect{sign_up_bad_email}.not_to change(User, :count)
    expect(page).to have_content("Email has an invalid format")
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
