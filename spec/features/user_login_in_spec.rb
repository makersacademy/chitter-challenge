feature "User Log In" do

  context '#successful login' do
    scenario 'user is authenticated before logging in to the app' do
      sign_up
      find(:css, "a[href='/sessions/new']").click
      fill_in('email', with: "test@test.com")
      fill_in('password', with: "password")
      click_button('Log in')
      expect(page).to have_content "Welcome, test@test.com"
    end
  end

  context '#unsuccessful login - wrong pasword' do
    scenario 'user is authenticated before logging in to the app' do
      sign_up
      find(:css, "a[href='/sessions/new']").click
      fill_in('email', with: "test@test.com")
      fill_in('password', with: "pass")
      click_button('Log in')
      expect(page).to have_content 'The email or password is incorrect'
    end
  end

  context '#unsuccessful login - wrong email' do
    scenario 'user is authenticated before logging in to the app' do
      sign_up
      find(:css, "a[href='/sessions/new']").click
      fill_in('email', with: "test@test2.com")
      fill_in('password', with: "password")
      click_button('Log in')
      expect(page).to have_content 'The email or password is incorrect'
    end
  end
end
