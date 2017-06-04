feature 'Sign In' do

  let!(:user) do
    User.create(email: 'john@doe.com',
                username: 'johndoe',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
