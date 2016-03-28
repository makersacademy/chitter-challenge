feature 'new user signup: ' do

  before :each do
    visit '/'
  end

  scenario 'user can click a link to register' do
    expect(page).to have_link "register_link"
  end

  feature 'registration form ' do

    before :each do
      click_link "register_link"
    end

    scenario 'has a field for the username' do
      expect(page).to have_field "username"
    end

    scenario 'has a field for the email' do
      expect(page).to have_field "email"
    end

    scenario 'has a field for the password' do
      expect(page).to have_field "password"
    end

    scenario 'has a field for the pass confirmation' do
      expect(page).to have_field "confirm"
    end

    scenario 'has a button to register' do
      expect(page).to have_button "register"
    end

  end

  feature 'registration process' do

    before :each do
      click_link "register_link"
      fill_in "username" , with: "test_user"
      fill_in "email" , with: "test_mail"
      fill_in "password" , with: "test_pwd"
      fill_in "confirm" , with: "test_pwd"
    end

    scenario 'new user logs in if registration is successful' do
      click_button "register"
      expect(page).to have_content "you're signed in as test_user"
    end

    scenario 'form is presented again if pass do not match' do
      fill_in "confirm" , with: "wrong_pwd"
      click_button "register"
      expect(page).to have_content "Passwords do not match, try again"
    end

    scenario 'form is presented again if user exists' do
      User.create(username: "test_user" , pass: "test_pwd", email: "nil")
      click_button "register"
      expect(page).to have_content "User already exists, try again"
    end

  end

end
