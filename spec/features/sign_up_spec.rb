require 'spec_helper'


feature 'User sign up with matching password' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Welcome, me@me.com')
    expect(User.first.email).to eq('me@me.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
