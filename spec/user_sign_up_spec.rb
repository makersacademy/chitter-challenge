require 'spec_helper'

feature 'I want to sign up for Chitter' do
  scenario 'Allow user to create a Chitter account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/home'
    expect(page).to have_content("Hello tansaku")
    expect(User.first.email).to eq("sam@makersacademy.com")
  end

  scenario 'If user password and password_confirmation do not match, a new Chitter account is not created' do
    expect { sign_up(password_confirmation: 'secret') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'If user has left email address field empty, a new Chitter account is not created' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'User must enter a valid email address or a new Chitter account is not created' do
    expect { sign_up(email: "jennifer@jen") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Email has an invalid format")
  end

  scenario 'User must enter a unique email address or a new Chitter account is not created' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Email is already taken")
  end

  scenario 'If user has left username field empty, a new Chitter account is not created' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Username must not be blank")
  end

  scenario 'User must enter a unique username or a new Chitter account is not created' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Username is already taken")
  end

end
