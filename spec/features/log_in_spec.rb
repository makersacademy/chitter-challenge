feature 'User logs in' do
  let!(:user) do
    User.create(
      name: 'sam',
      user_name: 'supersam',
      email: 'user@example.com',
      password: 'secret1234',
      password_confirmation: 'secret1234')
    end

    scenario 'with correct credentials' do
      sign_in(email: user.email,   password: user.password)
      expect(page).to have_content "Welcome, #{ user.user_name }"
    end
end
