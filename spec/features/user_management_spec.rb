require 'web_helper'

feature 'User sign up' do

  scenario 'user can sign up for a Chitter account' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, chitmeister49')
    expect(User.first.email).to eq('chittychitty@peeppeep.com')
    expect(User.first.name).to eq('John')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "sign up requires an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "sign up email address must be valid" do
    expect { sign_up(email: "not an email address") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "sign up requires a username" do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario "email and username must be unique" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('Username is already taken')
  end

end
