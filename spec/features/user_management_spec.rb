require 'spec_helper'

feature 'User can register' do

  let!(:user) { build :user }
  # Strictly speaking, the tests that check the UI
  # (have_content, etc.) should be separate from the tests
  # that check what we have in the DB since these are separate concerns
  # and we should only test one concern at a time.

  # However, we are currently driving everything through
  # feature tests and we want to keep this example simple.
  scenario 'I can register as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, #{user.name}"
    expect(User.first.email).to eq 'james.bond@mi6.com'
    #add page.status_code and refactor the test later
  end

  def sign_up(user)
    visit '/'
    fill_in 'email',                 with: user.email
    fill_in 'password',              with: user.password
    fill_in 'name',                  with: user.name
    fill_in 'username',              with: user.username
    click_button 'Sign up'
  end
end
