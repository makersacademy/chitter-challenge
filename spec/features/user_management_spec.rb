require './spec/web_helper'

feature 'User signs up' do
  scenario 'A user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test!')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario "the passwords need to match" do
    expect {sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "the user must have an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "the user must use a valid email address" do
    expect {sign_up(email: 'dan@dan') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "the user must enter their name" do
    expect {sign_up(name: nil)}.not_to change(User, :count)
  end

  scenario "the user is already signed up" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

end
