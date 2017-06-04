# User Story 4
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, godzilla@tokyo.com')
    expect(User.first.email).to eq('godzilla@tokyo.com')
  end
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'godzilla@tokyo.com'
  fill_in :password, with: 'wasabe!'
  click_button 'Sign up'
end

