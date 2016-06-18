# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
# sign up to chitter with their email, password, name and a user name
require_relative 'web_helpers'

feature 'User sign up' do
  scenario 'New users can sign up' do
    visit '/user/signup'
    expect(page.status_code).to eq(200)
    sign_up
    expect(page).to have_content 'Welcome Alex'
  end
end



  # def sign_up
  #   visit '/users/new'
  #   expect(page.status_code).to eq(200)
  #   fill_in :email,    with: 'alice@example.com'
  #   fill_in :password, with: 'oranges!'
  #   click_button 'Sign up'
  # end
  #
  # # spec/features/user_management_spec.rb
  # feature 'User sign up' do
  #   scenario 'I can sign up as a new user' do
  #     expect { sign_up }.to change(User, :count).by(1)
  #     expect(page).to have_content('Welcome, alice@example.com')
  #     expect(User.first.email).to eq('alice@example.com')
  #   end
  # end
