feature 'sign in' do
  let(:user) do
    User.create(username: 'Andrew', email: 'test@test.com', password: 'password', password_confirmation: 'password')
  end

    scenario 'User can sign in with correct login details' do
      sign_in(user.email, user.password)
      expect(page).to have_content("Welcome back, #{user.username}")
    end
  end
