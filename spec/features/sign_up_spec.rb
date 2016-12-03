require_relative '../../app/models/user'

RSpec.feature 'Sign up' do
  let(:email)  { 'jane@email.com' }
  let(:name) { 'Jane Doe' }
  let(:username) { 'jdogg14' }
  let(:password) { 'abcd1234' }

  scenario 'A user can use sign up form' do
    visit '/sign-up/new'
    fill_in 'email', with: :email
    fill_in 'name', with: :name
    fill_in 'username', with: :username
    fill_in 'password', with: :password
    click_button('Sign Up')
    expect(current_path).to eq '/'
  end

  scenario 'After sign up user gets a welcome message' do
    visit '/sign-up/new'
    fill_in 'email', with: :email
    fill_in 'name', with: :name
    fill_in 'username', with: :username
    fill_in 'password', with: :password
    click_button('Sign Up')
    expect(page).to have_content 'Welcome to Chitter'
  end


end
