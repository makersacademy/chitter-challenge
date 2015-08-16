feature 'User can sign up and sign in' do
  let(:user) { user = build(:user) }

  context 'Sign up' do
    scenario 'I can sign up as a new user' do
      sign_up(user)
      expect(page).to have_content("Welcome, #{user.user_name}!")
    end
  end

end