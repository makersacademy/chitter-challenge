feature 'Users' do

  context 'when signing up' do

     scenario 'can sign up' do
      user = build(:user)
      expect{sign_up(user)}.to change(User, :count).by (1)
      expect(page).to have_content("Welcome, #{user.username}")
      expect(User.first.email).to eq("#{user.email}")
    end

    scenario 'must provide an email address' do
      no_email = build(:user, email: nil)
      sign_up(no_email)
      click_button 'Sign up'
      expect(page).to have_content "Email must not be blank"
    end

    scenario 'must provide a username' do
      no_username = build(:user, username: nil)
      sign_up(no_username)
      click_button 'Sign up'
      expect(page).to have_content "Username must not be blank"
    end
  end

  context 'after signing up' do

    scenario 'can sign in' do
      user = build(:user)
      sign_up(user)
      sign_in(user)
      expect(page).to have_content "Welcome, #{user.username}"
    end

    scenario 'can sign out' do
      user = build(:user)
      sign_up(user)
      sign_in(user)
      sign_out
      expect(page).to have_content "Goodbye!"
    end
  end
  
end