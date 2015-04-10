require 'spec_helper'

feature 'Signing up' do
  scenario 'as a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test_name')
    expect(User.first.email).to eq('test@test.com')
    expect(User.first.name).to eq('test_name')
    expect(User.first.username).to eq('user_numero_uno')
  end

  context 'with a password that does not match' do
    # before(:each) do
    #   let(:faulty_sign_up) 
    # end
    scenario 'doesnt add the user to the database' do
      expect { sign_up('test@test.com', '12345', '12346') }.to change(User, :count).by(0)
    end

    # scenario 'redirects the user back to the sign up form' do
    #   sign_up('test@test.com', '12345', '12346')
    #   expect(current_path).to eq('/users')
    # end
  end
  # scenario 'with a password that does not match' do
  # end

  # scenario 'with an email that is already registered' do
  # end
end

def sign_up(email = 'test@test.com',
            password = '12345',
            password_confirmation = '12345',
            name = 'test_name',
            username = 'user_numero_uno')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :username, with: username
  click_button 'Sign up'
end