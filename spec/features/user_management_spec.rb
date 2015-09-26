require 'spec_helper'

feature 'User can register' do

  # Strictly speaking, the tests that check the UI
  # (have_content, etc.) should be separate from the tests
  # that check what we have in the DB since these are separate concerns
  # and we should only test one concern at a time.

  # However, we are currently driving everything through
  # feature tests and we want to keep this example simple.
  scenario 'I can register as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, James Bond" # - Do separate test
    expect(User.first.email).to eq"james.bond@mi6.com"
  end

  xscenario 'I cannot register with an existing email' do
    user = create :user, email: 'james@bond.com'
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content "Email is already taken"
  end

  xscenario 'I cannot register twice with the same username' do
    user = create :user, username: 'bond'
    expect { sign_up(user) }.to change(User, :count).by(0)
  end

  def sign_up(user)
    visit '/'
    fill_in 'email',    with: user.email
    fill_in 'password', with: user.password
    fill_in 'name',     with: user.name
    fill_in 'username', with: user.username
    click_button "Sign up"
  end
end

feature 'User can login' do
  let!(:user) { create :user }

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  def sign_in(email:, password:)
    visit '/'
    fill_in :user,     with: 'james_bond'
    fill_in :password, with: 'agent007'
    click_button "Login"
  end
end
