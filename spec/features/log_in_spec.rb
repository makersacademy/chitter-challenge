require_relative '../helper_methods.rb'

feature 'Logging in' do

  before(:each) do
    User.create(email:'test@test.com',
            password:'12345',
            password_confirmation:'12345',
            name:'test_name',
            username:'user_numero_uno')
  end
  
  context 'when we havent logged in' do
    scenario 'we are not logged in' do
      visit '/'
      expect(page).not_to have_content('Welcome, user_numero_uno')
      expect(page).not_to have_selector(:link_or_button, 'Log out')
      expect(page).to have_selector(:link_or_button, 'log in')
    end
    scenario 'we are presented a log in form' do
      visit '/sessions/new'
      expect(page).to have_content('log in')
    end
    scenario 'we are presented a link to sign up' do
      visit '/'
      expect(page).to have_selector(:link_or_button, 'sign up')
    end
  end
  context 'with correct details' do
    scenario 'welcomes us on the homepage' do
      sign_in
      expect(current_path).to eq '/'
      expect(page).to have_content('Welcome, user_numero_uno')
      expect(page).to have_selector(:link_or_button, 'Log out')
      expect(page).not_to have_selector(:link_or_button, 'log in')
      expect(page).not_to have_selector(:link_or_button, 'sign up')
    end
  end

  context 'with incorrect details' do
    scenario 'we are prompted to log in again' do
      sign_in('test@test.com', '4567')
      expect(current_path).to eq('/sessions/new')
    end
    scenario 'and given a warning' do
      sign_in('test@test.com', '4567')
      expect(page).to have_content('email or password is incorrect')
    end
  end
end
