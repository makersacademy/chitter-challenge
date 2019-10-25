feature 'Loading the signup page' do
    scenario 'The signup page loads when a user trys to connect' do
       visit('/signup')
      expect(page).to have_content 'Signup to chitter'
    end
 end

 feature 'User can signup to chitter ' do 
   scenario 'The user can signup' do 
      visit('/signup')
      fill_in('name', with: 'testbot')
      fill_in('username', with: 'testbot3')
      fill_in('email', with: 'testbot323@gmail.com')
      fill_in('password', with: '1234')
      click_button('submit')
      expect(page.current_path).to eq '/'
   end 
 end