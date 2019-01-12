RSpec.feature 'Warble' do
  context 'Sign Up' do
    scenario 'A new Warbler joins Warble and lands on their own profile page' do
      visit '/'
      fill_in :username, with: 'christof'
      fill_in :email, with: 'chris@makers.com'
      fill_in :password, with: 'classicWoW'
      click_button 'Sign Up'
      expect(page.current_path).to eq('/private_profile/1')
      expect(page).to have_content('christof')
    end
  end
end
