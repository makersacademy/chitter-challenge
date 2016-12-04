require 'spec_helper.rb'

feature 'sign up' do
  scenario 'see sign up form' do
    visit('/users/sign-up')
    expect(page).to have_content("sign up")
    find_field('email')
    find_field('password')
    find_button('sign up')
  end

  scenario 'user can sign up for chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('welcome, hello@example.com')
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
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
