feature 'User signs out' do

  before(:each) do
    User.create(username: 'chun-li',
                email: 'chun-li@streetfighter.com',
                password: 'securepassword',
                password_confirmation: 'securepassword')
    end

    scenario 'while being logged in' do
      log_in(email: 'chun-li@streetfighter.com', password: 'securepassword')
      click_button 'Log Out'
      expect(page).to have_content 'See you again soon!'
      expect(page).not_to have_content 'Welcome, chun-li'
    end

end
