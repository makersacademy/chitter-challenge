require 'spec_helper'

feature 'User can register' do

  # Strictly speaking, the tests that check the UI
  # (have_content, etc.) should be separate from the tests
  # that check what we have in the DB since these are separate concerns
  # and we should only test one concern at a time.

  # However, we are currently driving everything through
  # feature tests and we want to keep this example simple.

  scenario 'I can register as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, james.bond@mi6.com"
    expect(User.first.email).to eq"james.bond@mi6.com"
  end

  scenario 'I cannot register twice with the same username' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
  end

  scenario 'I cannot register twice with the same email' do
    sign_up
    expect { sign_up(username: 'bob') }.to change(User, :count).by(0)
  end

  def sign_up(email: "james.bond@mi6.com",
    password: 'oranges!', name: 'James Bond',
    username: 'james_bond')
    visit '/'
    fill_in 'email',    with: email
    fill_in 'password', with: password
    fill_in 'name',     with: name
    fill_in 'username', with: username
    click_button "Sign up"
  end
end
