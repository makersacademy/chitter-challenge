RSpec.feature 'Signin' do
  context 'Existing user' do
    let!(:user) { User.create(
      username: 'christos',
      email: 'christos@makers.com',
      password: 'ClassicWoW')
    }    

    scenario 'Warbler signs in and lands on their profile' do
      visit '/'
      fill_in :sign_in_username, with: 'christos'
      fill_in :sign_in_password, with: 'ClassicWoW'
      click_button 'Sign In'
      click_button 'Sign Out'
      expect(page.current_path).to eq('/')
    end
  end

end
