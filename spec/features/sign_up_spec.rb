require 'spec_helper.rb'

feature 'sign up' do
  scenario 'see sign up form' do
    visit('/users/sign-up')
    expect(page).to have_content("sign up")
    find_field('name')
    find_field('username')
    find_field('email')
    find_field('password')
    find_button('sign up')
  end

  scenario 'user can sign up for chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('welcome, @amanda')
    expect(User.first.email).to eq('hello@example.com')
  end

  scenario 'user is unable to sign up without confirming password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cannot sign up without an email address' do
      expect { sign_up(email: nil) }.not_to change(User, :count)
      expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up with an email address that is already registered' do
    sign_up
    expect { sign_up(username: 'lionel') }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'user cannot sign up without a username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'user cannot sign up with a username that is already registered' do
    sign_up
    expect { sign_up(email: 'different@email.com') }.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'user cannot sign up without a name' do
    expect { sign_up(name: nil) }.not_to change(User, :count)
    expect(page).to have_content('Name must not be blank')
  end
end
