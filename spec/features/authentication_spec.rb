feature 'authentication' do

  context 'user has been created' do

    before(:each) do
      User.create(
          email: 'samm@makersacademy.com', 
          password: 'password123', 
          name: 'Sam Morgan',
          username: 'sjmog'
        )
    end

    scenario "a user can sign in" do

      visit '/sessions/new'
      fill_in 'email', with: 'samm@makersacademy.com'
      fill_in(:password, with: 'password123')
      click_button 'Sign in'

      expect(current_path).to eq '/peeps'
      expect(page).to have_content 'Welcome, sjmog'

    end

    scenario 'a user sees an error if they get their email wrong' do

      visit '/sessions/new'
      fill_in 'email', with: 'wrongemail@makersacademy.com'
      fill_in 'password', with: 'password123'
      click_button 'Sign in'

      expect(page).not_to have_content 'Welcome, sjmog'
      message = 'The email and password that you entered did not match our records. Please double-check and try again.'
      expect(page).to have_content message

    end

  end
  

end
