require 'spec_helper'

feature 'signup form' do
  scenario 'fill and submit form' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('newuser@gmail.com')
    expect(page).to have_content('Welcome, newuser@gmail.com!')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match'
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up without a username" do
   expect { sign_up(username: nil) }.not_to change(User, :count)
   expect(current_path).to eq('/users')
   expect(page).to have_content('Username must not be blank')
  end

  scenario "I can't sign up without a name" do
   expect { sign_up(name: nil) }.not_to change(User, :count)
   expect(current_path).to eq('/users')
   expect(page).to have_content('Name must not be blank')
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
  sign_up
  expect { sign_up }.to_not change(User, :count)
  expect(page).to have_content('Email is already taken')
end

end
