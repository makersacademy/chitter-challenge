require 'web_helper'

feature 'User Sign Up' do
  def sign_up(name: 'MadMax',
              email: 'madmax@gmail.com',
              username: 'MadMaxamillion',
              password: '12345678',
              password_confirmation: '12345678')
    visit 'users/new'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
    end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, madmax@gmail.com')
    expect(User.first.email).to eq('madmax@gmail.com')
  end

  scenario 'confirming matching password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario "I can't sign up with an incorrect password confirmation" do
    sign_up(password_confirmation: 'Wrong')
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end

feature 'User sign in' do
  let!(:user) do
    User.create(email: 'test@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, #{user.email}")
  end
end
