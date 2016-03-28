feature 'existing user login: ' do

  before :each do
    visit '/'
  end

  feature 'login form ' do

    scenario 'has a field for the username' do
      expect(page).to have_field "username"
    end

    scenario 'has a field for the password' do
      expect(page).to have_field "password"
    end

    scenario 'has a button to login' do
      expect(page).to have_button "login"
    end

  end

  feature 'login process' do

    before :each do
      User.create(username: "test_user" , pass: "test_pwd", email: "nil")
      fill_in "username" , with: "test_user"
      fill_in "password" , with: "test_pwd"
    end

    scenario 'new user logs in if login is successful' do
      click_button "login"
      expect(page).to have_content "you're signed in as test_user"
    end

    scenario 'form is presented again if login fails' do
      fill_in "password" , with: "wrong_pwd"
      click_button "login"
      expect(page).to have_content "Wrong User or password, try again"
    end

    scenario 'logout link is present for a logged user' do
      click_button 'login'
      expect(page).to have_link "click here to log out"
    end

  end

end
