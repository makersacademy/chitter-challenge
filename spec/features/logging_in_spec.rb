feature 'Logging in' do

  let!(:user) do
    User.create(email: 'david@example.com',
                name: 'David',
                user_name: 'haletothewood',
                password: 'password!',
                password_confirmation: 'password!')
  end

  scenario 'I can log in with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end
end
