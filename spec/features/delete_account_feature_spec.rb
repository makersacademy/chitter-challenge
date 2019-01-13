RSpec.feature 'Delete account' do
  context 'Chosing whether to delete account or not' do
    let!(:user) { User.create(
      username: 'Mr_Chris',
      email: 'MrChris@makers.com',
      password: 'ClassicWoW')
    }    

    scenario 'A user confirms choice to delete account' do
      visit '/'
      fill_in :sign_in_username, with: 'Mr_Chris'
      fill_in :sign_in_password, with: 'ClassicWoW'
      click_button 'Sign In'
      click_link 'Delete Account'
      click_button "I'm done Warbeling, delete me!"
      visit '/'
      fill_in :sign_in_username, with: 'Mr_Chris'
      fill_in :sign_in_password, with: 'ClassicWoW'
      click_button 'Sign In'
      expect(page.current_path).to eq '/'
    end

    scenario 'A user choses not to delete account' do
      visit '/'
      fill_in :sign_in_username, with: 'Mr_Chris'
      fill_in :sign_in_password, with: 'ClassicWoW'
      click_button 'Sign In'
      click_link 'Delete Account'
      click_button "I'm not done Warbeling, don't delete me!"
      expect(page.current_path).to eq '/private_profile/2'
    end
  end

end
