feature 'User can sign up and sign in' do
  let(:user) { user = build(:user) }

  context 'Sign up' do
    scenario 'I can sign up as a new user' do
      sign_up(user)
      expect(page).to have_content("Welcome, #{user.user_name}!")
    end

    scenario 'requires a matching confirmation password' do
      user = build(:user, password_confirmation: 'wrong')
      sign_up(user)
      expect(page).to have_content('Password does not match the confirmation')
    end

    scenario 'requires email not to be empty' do
      user = build(:user, email: "")
      sign_up(user)
      expect(page).to have_content('Email must not be blank')
    end

    scenario 'cannot register user twice' do
      sign_up(user)
      sign_up(user)
      expect(page).to have_content('Email is already taken')
    end

  end

  context "Log in" do

    scenario "with correct credentials" do
      sign_up(user)
      sign_in(user)
      expect(page).to have_content "Welcome, #{user.user_name}!"
    end

  end

  context "Log out" do

    scenario "while being signed in the user can sign out" do
      sign_up(user)
      sign_in(user)
      click_button "Log out"
      expect(page).to have_content "You have logged out"
    end

  end

end