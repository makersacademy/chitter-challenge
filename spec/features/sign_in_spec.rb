require 'spec_helper'

feature 'sign in' do
  before(:each) do
    User.create(name: 'name',
    username: 'user',
    email: 'test@test.com',
    password: 'password',
    password_conf: 'password')
  end

  context 'valid sign in' do
    scenario 'user can sign in' do
      sign_in('test@test.com', 'password')
      expect(current_path).to eq('/peeps')
    end
    scenario 'welcome message is displayed' do
      sign_in('test@test.com', 'password')
      expect(page).to have_content('Welcome, test@test.com')
    end
  end
  context 'invalid sign in' do
    scenario 'user cant sign in' do
      sign_in('test@test.com', 'password2')
      expect(current_path).to eq('/')
    end
    scenario 'error message is displayed' do
      sign_in('test@test.com', 'password2')
      expect(page).to have_content('Sorry, there was a problem: The email or password is incorrect.')
    end
  end
end
