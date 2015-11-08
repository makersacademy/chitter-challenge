feature "Login Page" do

  context "when logging in:" do

    before do
      visit('/users/sign-up')
      fill_in('username', with: 'test_account')
      fill_in('email', with: 'test@account.com')
      fill_in('name', with: 'Sinatra McCapybara')
      fill_in('password', with: 'opensesam3')
      fill_in('password_confirmation', with: 'opensesam3')
      click_button('Sign up!')
      click_link('Logout')
      visit('/users/login')
    end

    scenario "the user should be be able to log in with their details" do
      fill_in('username', with: 'test_account')
      fill_in('password', with: 'opensesam3')
      click_button('Log in!')
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
      fill_in('username', with: 'test_account')
      fill_in('password', with: 'opensesam3')
      click_button('Log in!')
      click_link('Logout')
      expect(page).to have_content('Sinatra, you have successfully logged out from Chitter now.')
      click_link('Back to the main page.')
      click_link('login')
      expect(current_path).to eq('/users/login')
    end

  end

end