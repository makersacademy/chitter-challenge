feature 'User Authentication' do
  context 'Signup' do
    scenario 'User can signup' do
      visit '/'
      fill_in :sign_up_username, with: 'christos'
      fill_in :sign_up_email, with: 'christos@makers.com'
      fill_in :sign_up_password, with: 'ClassicWoW'
      click_button 'Sign Up'
      p current_path
      expect(page.current_path).to eq('/private_profile/4')
      expect(page).to have_content('christos')
    end

    scenario 'A user cannot signup if email already used' do
      visit '/'
      fill_in :sign_up_username, with: 'christo'
      fill_in :sign_up_email, with: 'christo@makers.com'
      fill_in :sign_up_password, with: 'ClassicWoW'
      click_button 'Sign Up'
      p current_path
      click_button 'Sign Out'
      fill_in :sign_up_username, with: 'christo_2'
      fill_in :sign_up_email, with: 'christo@makers.com'
      fill_in :sign_up_password, with: 'ClassicWoW'
      click_button 'Sign Up'
      expect(page.current_path).to eq('/')
    end
  end

end
