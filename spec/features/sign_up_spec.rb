require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up_correct_password }.to change(User, :count)
    expect(page).to have_content('Welcome, matt@matt.com')
    expect(User.first.email).to eq('matt@matt.com')
  end

  scenario 'password confirmation' do
    expect { sign_up_wrong_password }.to_not change(User, :count)
  end

  scenario 'password does not match' do
    sign_up_wrong_password
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up_no_email }.to_not change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up_correct_password
    expect { sign_up_correct_password }.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up_invalid_email }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

end
