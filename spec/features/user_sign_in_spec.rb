feature 'User sign in ' do

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome #{user.email}"
  end
end
