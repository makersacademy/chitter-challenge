feature 'Loading the login page' do
    scenario 'The login page loads when a user trys to connect' do
       visit('/login')
      expect(page).to have_content 'Login to Chitter'
    end
 end
 
 feature 'User can login with correct username and password' do 
   scenario 'The user can login' do 
      visit('/login')
      fill_in('username', with: 'josh')
      fill_in('password', with: '1234')
      click_button('submit')
      expect(page.current_path).to eq '/'
   end 
 end

 feature 'User trys to login with incorrect details' do 
   scenario 'The user cannot login' do 
      visit('/login')
      fill_in('username', with: 'wrong')
      fill_in('password', with: 'info')
      click_button('submit')
      expect(page.current_path).to eq '/login'
   end 
 end