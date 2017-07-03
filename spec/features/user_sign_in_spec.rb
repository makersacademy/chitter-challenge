feature 'User sign in ' do

  let!(:user) do
    User.create(email: 'user@example.com',
                firstname: 'Ben',
                lastname: 'Chan',
                username: 'bc24',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome #{user.username}"
  end
end
