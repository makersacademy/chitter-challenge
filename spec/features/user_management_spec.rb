require 'spec_helper'

feature 'User signs up' do

  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Sammy')
    expect(User.first.email).to eq('sammy@example.com')
  end

  scenario 'with a password that doesnt match' do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

  def sign_up(email = 'sammy@example.com',
              password = 'lolol',
              password_confirmation = 'lolol',
              name = 'Sammy',
              username = 'Vinyls')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end

# feature 'User signs in' do
#   before(:each) do
#     User.create(email: 'test@test.com',
#                 password: 'test',
#                 password_confirmation: 'test')
#   end
#
#   scenario 'with correct credentials' do
#     visit '/'
#     sign_in('test@test', 'test')
#     expect(page).to have_content('Welcome,')
#   end
#
#   scenario 'with incorrect credentials' do
#     visit '/'
#     sign_in('test@test', 'bla')
#     expect(page).not_to have_content('Welcome, Dude!')
#   end
#
#   def sign_in(email, password)
#     visit '/sessions/new'
#     fill_in 'email', with: email
#     fill_in 'password', with: password
#     click_button 'Sign in'
#   end
# end
