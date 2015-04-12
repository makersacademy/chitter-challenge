# require 'spec_helper'

feature 'User signs up' do
  scenario 'when being a new user visiting Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello Sexy_frenchman')
    expect(User.first.email).to eq('Guillaume@chittest.com')
  end

  scenario 'with a password that doesn\'t match' do
    expect { sign_up('a@bc.com', 'abc', 'Ab Cd' 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, your passwords do not match')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already registered')
  end

  scenario 'with a username that is already taken' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This username is already taken')
  end
end

  def sign_up(email = 'Guillaume@chittest.com',
              username = 'Sexy_frenchman',
              name = 'Guillaume Bouffard',
              password = 'helloworld',
              password_confirmation = 'helloworld')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

feature 'User signs in' do
  before(:each) do
    User.create(email: 'test@test.com',
                username: 'Mister_Test',
                name: 'Tasty Tester',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Hello Mister_Test')
    sign_in('Mister_Test', 'test')
    expect(page).to have_content('Hello Mister_Test')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Hello Mister_Test')
    sign_in('Mister_Test', 'wrongpass')
    expect(page).not_to have_content('Hello Mister_Test')
  end

  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Sign in'
  end

end

# feature 'User signs out' do
#   scenario 'while being signed in' do
#   end
# end

# feature 'User forgot his/her password' do
#   scenario 'while knowing his email' do
#   end
# end
