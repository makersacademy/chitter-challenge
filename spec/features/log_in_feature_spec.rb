require_relative '../database_helpers.rb'

feature 'User Log in' do
  scenario 'user is at index and wants to log in' do
    visit('/')
    click_on('Log In')
    expect(current_path).to eq '/log-in'
  end
  
  context 'user does not have an account' do
    scenario 'user does not have an account and can navigate to the sign up page' do
      visit('/log-in')
      click_on('Sign Up')
      expect(current_path).to eq '/sign-up'
    end
    
    scenario 'user tries to log in with invalid credentials and is denied' do
      visit('/log-in')
      fill_in("email", with: 'nonexistant@invalid.com')
      fill_in("password", with: 'nopassword')
      click_on('Log In')
      expect(current_path).to eq '/log-in'
    end
  end

  context 'user does have an account' do
    before do
      add_user_to_DB()
    end

    scenario 'user logs in with valid credentials and is redirected to index' do
      visit('/log-in')
      fill_in("email", with: 'johnsmith@example.com')
      fill_in("password", with: 'password123')
      click_on('Log In')
      expect(current_path).to eq '/'
    end
  end

end