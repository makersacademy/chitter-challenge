feature "Login Page" do

  context "when logging in:" do

    before do
      test_sign_up
      click_link('Logout')
      visit('/sessions/new')
    end

    scenario "the user should be be able to log in with their details" do
      login
      expect(current_path).to eq('/main/peeps')
      expect(page).to have_content('Welcome to Chitter, Sinatra!')
    end

    scenario "incorrect details will fail the login process" do
      fill_in('username', with: 'test_account')
      fill_in('password', with: 'wrong')
      click_button('Log in!')
      within('div#login_failed') do
        expect(page).to have_content('Login failed, please confirm you have entered the correct details.')
      end
    end

    scenario "a logged in user can log out" do
      login
      click_link('Logout')
      expect(page).to have_content('Sinatra, you have successfully logged out from Chitter now.')
      click_link('Back to the main page.')
      click_link('login')
      expect(current_path).to eq('/sessions/new')
    end

  end

end