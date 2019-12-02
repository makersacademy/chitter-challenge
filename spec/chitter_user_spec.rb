require './app/models/user.rb'

describe Chitter_user do
  let(:user) do
    Chitter_user.create(name: 'Richard', username: 'richard_thompson',
                email: 'richardthompson@cmail.com', password: '1234567',
                password_confirmation: '1234567')
  end

  it 'authenticates an email and password' do
      user = User.new
      authenticated_user = Chitter_user.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    feature 'Sign up for Chitter' do

# As a Maker
# So that I can sign up for Chitter
# I want to see the welcome page
    scenario 'I want to visit the welcome page' do
        visit '/'
        expect(page).to have_content('Welcome to Chitter')
    end
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

    feature 'Sign in at Chitter' do
        before do
          sign_up(name: 'Richard Thompson')
        end

# As a Maker
# So that I can use Chitter
# I want to sign in with my email and password
  scenario 'I want to log in with my email and password' do
    log_in
    expect(page).to have_content('Welcome, Richard')
  end
