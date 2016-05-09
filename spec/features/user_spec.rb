require 'tilt/erb'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, John")
    expect(User.first.email).to eq("john@example.com")
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up without a name inputted" do
    expect { sign_up(name: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up without an username" do
    expect { sign_up(username: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username is already taken')
  end

  def sign_up(name: 'John',
              username:'j.smith',
              email: 'john@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end

feature 'Logins' do

  feature 'User sign in' do
    scenario 'signs in with correct credentials' do
      sign_up
      sign_in(email: 'john@example.com',   password: '123456')
      expect(page).to have_content "Welcome, John"
    end
  end

  feature 'User signs out' do
    scenario 'can sign out if currently signed in' do
      sign_up
      sign_in(email: 'john@example.com', password: '123456')
      click_button 'Sign out'
      expect(page).to have_content('You have logged out.')
      expect(page).not_to have_content('Welcome, John')
    end
  end
end
