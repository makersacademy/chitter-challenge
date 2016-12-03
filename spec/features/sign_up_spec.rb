require_relative '../../app/models/user'

RSpec.feature 'Sign up' do
  let(:email)  { 'jane@email.com' }
  let(:name) { 'Jane Doe' }
  let(:username) { 'jdogg14' }
  let(:password) { 'abcd1234' }

  scenario 'A user can sign up' do
    visit '/sign-up'
    fill_in 'email', with: :email
    fill_in 'name', with: :name
    fill_in 'user_name', with: :username
    fill_in 'password', with: :password
    click_button('Sign Up')
    expect(page).to have_content 'Welcome To Chitter Jane'
  end


end
