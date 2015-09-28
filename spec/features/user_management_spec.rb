require 'spec_helper'

feature 'User registration' do

  # Strictly speaking, the tests that check the UI
  # (have_content, etc.) should be separate from the tests
  # that check what we have in the DB since these are separate concerns
  # and we should only test one concern at a time.

  # However, we are currently driving everything through
  # feature tests and we want to keep this example simple.
  scenario 'User can register as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, James Bond" # - Do separate test
    expect(User.first.email).to eq"james.bond@mi6.com"
  end

  scenario 'User cannot register with an existing email' do
    user = create :user
    fake_user = build :user, username: 'JamesBond'
    expect { sign_up(fake_user) }.to change(User, :count).by(0)
    expect(page).to have_content "Email is already taken"
  end

  scenario 'User cannot register with an existing username' do
    user = create :user, email: 'agent007@mi6.com'
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content "Username is already taken"
  end

end

feature 'User login process' do
  let!(:user) { create :user }

  scenario 'User can login with correct credentials' do
    sign_in(user: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  scenario 'User cannot login with incorrect credentials' do
    sign_in(user: 'bond', password: user.password)
    expect(page).to have_content "The username or password is incorrect"
  end

end

feature 'User can sign out' do
  let(:user) { create :user }

  scenario 'while sign in, I can sign out' do
    sign_in(user: user.username, password: user.password)
    click_button "Sign out"
    expect(page).to have_content "Goodbye #{user.name}"
    expect(page).not_to have_content "Welcome #{user.name}"
  end
end
