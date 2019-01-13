feature 'User Authentication' do
  context 'Sign Up' do
    scenario 'A user can sign up' do
      signuptest
      expect(page).to have_content 'Welcome, testy mctestface'
    end

    scenario "A user is redirected to their profile after signing up" do
      signuptest
      expect(current_path).to eq("/profile")
    end
  end

end
