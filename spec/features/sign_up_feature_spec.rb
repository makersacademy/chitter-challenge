require_relative 'web_helpers'

RSpec.feature 'User Authentication' do
  context 'Signup' do
    scenario 'User can signup' do
      visit '/'
      input_signup_details
      click_button 'Sign Up'
      expect(page.current_path).to eq('/private_profile/8')
      expect(page).to have_content('christos')
    end

    scenario 'A user cannot signup if email already used' do
      user = create_user('christos', 'christos@makers.com', 'Makers123')
      visit '/'
      input_signup_details
      fill_in :sign_up_username, with: 'christopher' # different username from user
      fill_in :sign_up_email, with: 'christos@makers.com' # same email as user
      fill_in :sign_up_password, with: 'Makers123'
      click_button 'Sign Up'
      expect(page.current_path).to eq('/')
    end

    scenario 'A user cannot signup if username already used' do
      user = create_user('christos', 'christos@makers.com', 'Makers123')
      visit '/'
      fill_in :sign_up_username, with: 'christos' # same username as user
      fill_in :sign_up_email, with: 'CH@makers.com' # different email from user
      fill_in :sign_up_password, with: 'Makers123'
      click_button 'Sign Up'
      expect(page.current_path).to eq('/')
    end
  end

end
