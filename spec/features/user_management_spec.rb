require 'spec_helper.rb'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter and see a welcome messgae

feature 'User registration' do
  scenario 'I can sign up as a new user' do
    expect { register }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome")
  end

  scenario 'requires a matching confirmation password' do
    expect { register(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with passwords that do not match' do
    expect { register(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't register without an email address" do
    expect { register(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't register without a valid email address" do
    expect { register(email: 'wrong@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "I can't register with a duplicate email address" do
    register
    expect { register }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
