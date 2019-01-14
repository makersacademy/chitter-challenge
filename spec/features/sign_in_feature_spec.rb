require_relative 'web_helpers'

RSpec.feature 'Signin' do
  context 'Existing user' do
    scenario 'A non existant user cannot signin' do
      visit '/'
      fill_in :sign_in_username, with: 'fail@makers.com'
      fill_in :sign_in_password, with: 'fail123'
      click_button 'Sign In'
      expect(page.current_path).to eq('/')
    end

    scenario 'Warbler signs in and lands on their profile' do
      user = create_user('christos', 'christos@makers.com', 'Makers123')
      sign_in
      expect(page.current_path).to eq("/private_profile/#{user.id}")
      expect(page).to have_content('christos')
    end
  end

end
