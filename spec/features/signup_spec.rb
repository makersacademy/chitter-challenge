require 'spec_helper'

feature 'Sign up' do

  scenario 'can sign up new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('You are logged in as eric@example.com')
  end
  scenario 'cannot sign up with mismatched confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content 'Password does not match the confirmation'
  end
  scenario 'cannot sign up with blank email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email must not be blank')
  end
  scenario 'cannot sign up with invalid email' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email has an invalid format')
  end
  scenario 'cannot sign up with duplicate email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
