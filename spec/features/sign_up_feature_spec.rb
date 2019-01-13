feature 'User Authentication' do
  context 'Signup' do
    let!(:user) { User.create(
      username: 'singleguy', 
      password: 'secretguy', 
      password: 'Secret123'
    )
    }    

    scenario 'User can signup' do
      visit '/'
      fill_in :sign_up_username, with: 'awesomedave'
      fill_in :sign_up_email, with: 'dave@makers.com' 
      fill_in :sign_up_password, with: 'Secret123'
      click_button 'Sign Up'
    end
  end

end
