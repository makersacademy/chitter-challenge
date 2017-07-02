require_relative '../web_helper'

feature 'Sign up for Chitter' do
  scenario 'sign up for a new account' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Hello, DizzyUnicorn')
    expect(User.first.username).to eq('DizzyUnicorn')
  end

  scenario 'confirm passwords don\'t match' do
    expect { sign_up(password_confirmation: 'rainforest') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match')
  end

  scenario 'cannot sign up with a blank email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'cannot sign up with an invalid email address' do
    expect { sign_up(email: "random@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'cannot sign up with an existing email address' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
