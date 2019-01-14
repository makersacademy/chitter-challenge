feature 'User Authentication' do
  context 'Sign Up' do
    scenario 'A user can sign up' do
      signuptest
      logintest
      expect(page).to have_content 'Hello, testy mctestface'
    end

    scenario "A user is redirected to the sign in page after signing up" do
      signuptest
      expect(current_path).to eq("/signin")
    end

    scenario "A user can't sign in with the wrong password" do
      signuptest
      loginbadpass
      expect(current_path).to eq("/error")
    end

    scenario "An unregistered user cannot login" do
      logintest
      expect(current_path).to eq("/error")
    end
  end

end
