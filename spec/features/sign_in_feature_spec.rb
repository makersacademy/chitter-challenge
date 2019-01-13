RSpec.feature 'Signin' do
  context 'Existing user' do
    let!(:user) { User.create(
      username: 'christos',
      email: 'christos@makers.com',
      password: 'ClassicWoW')
    }    

    scenario 'A non existant user cannot signin' do
      visit '/'
      fill_in :sign_in_username, with: 'fail@test.com'
      fill_in :sign_in_password, with: 'fail123'
      click_button 'Sign In'
      expect(page.current_path).to eq('/')
    end

    scenario 'Warbler signs in and lands on their profile' do
      visit '/'
      fill_in :sign_in_username, with: 'christos'
      fill_in :sign_in_password, with: 'ClassicWoW'
      click_button 'Sign In'
      expect(page.current_path).to eq('/private_profile/4')
      expect(page).to have_content('christos')
    end
  end

end
