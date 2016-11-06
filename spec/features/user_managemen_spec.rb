require_relative 'web_helper'

include SessionHelpers

feature 'User signs up' do
  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bo@bo.com')
    expect(User.first.email).to eq('bo@bo.com')
  end

  scenario "with a password that doesn't match" do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    logout
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end

feature 'User signs in' do
  before(:each) do
    User.create(email: 'bo@bo.com',
                password: 'bo',
                password_confirmation: 'bo')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, bo@bo.com')
    login('bo@bo.com', 'bo')
    expect(page).to have_content('Welcome, bo@bo.com')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, bo@bo.com')
    login('bo@bo.com', 'wrong')
    expect(page).not_to have_content('Welcome, bo@bo.com')
  end
end

feature 'User signs out' do
  before(:each) do
    User.create(email: 'bo@bo.com',
                password: 'bo',
                password_confirmation: 'bo')
  end

  scenario 'while being signed in' do
    login('bo@bo.com', 'bo')
    logout
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, bo@bo.com')
  end

end
