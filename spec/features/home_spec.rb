feature 'Loading the home page' do
    scenario 'The home page loads when a user trys to connect' do
       visit('/')
      expect(page).to have_content 'Welcome to chitter'
    end
 end

 feature 'User can submit a new peep' do 
   scenario 'A new peep can be posted by a logged in user' do 
      visit('/login')
      fill_in('username', with: 'josh')
      fill_in('password', with: '1234')
      click_button('submit')
      fill_in('text', with: 'Hello this is a test!')
      click_button('submit')
      expect(page).to have_content 'Hello this is a test!'
   end 
 end
 feature 'User trys to submit empty peep' do 
   scenario 'A new peep can not be empty' do 
      visit('/login')
      fill_in('username', with: 'josh')
      fill_in('password', with: '1234')
      click_button('submit')
      fill_in('text', with: '')
      click_button('submit')
      expect(page.current_path).to eq '/'
   end 
 end

 feature 'A logged in user can logout' do 
   scenario 'A user that is logged in can press the logout button and they will logout' do
      visit('/login')
      fill_in('username', with: 'josh')
      fill_in('password', with: '1234')
      click_button('submit')
      click_button('logout')
      expect(page.current_path).to eq '/'
   end 
 end 