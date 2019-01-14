feature 'Authentication:' do
  context 'Sign up' do
    let!(:user) { User.create(
      name: 'Socks',
      username: 'awesome',
      email: 'socks@socks.com',
      password: 'Secret'
    ) }
    scenario 'user can signup' do
      visit '/'
      expect(page).to have_content('Name:')
      expect(page).to have_content('Username:')
      expect(page).to have_content('Email:')
      expect(page).to have_content('Password:')
      fill_in :signup_name, with: 'Mitten'
      fill_in :signup_username, with: 'mits100'
      fill_in :signup_email, with: 'mits@socks.com'
      fill_in :signup_password, with: 'Secret123'
      click_button 'Sign Up'
    end

    scenario 'cannot sign up twice with same username' do
      visit '/'
      fill_in :signup_name, with: 'Mittens'
      fill_in :signup_username, with: 'mits100'
      fill_in :signup_email, with: 'mits@mits.com'
      fill_in :signup_password, with: 'Secret123'
      click_button 'Sign Up'

      expect(page.current_path).to eq '/'
      expect(page).to have_content('Username:')
      expect(page).to have_content('Password:')
    end
  end
  context 'Sign in' do
    let!(:user) { User.create(
      name: 'Socks',
      username: 'awesome',
      email: 'socks@socks.com',
      password: 'Secret'
    ) }
    scenario 'User can signin' do
      visit '/'
      fill_in :signin_username, with: 'awesome'
      fill_in :signin_password, with: 'Secret'
      click_button 'Log In'

      expect(page).to have_content('Welcome Socks')
    end
  end
end
