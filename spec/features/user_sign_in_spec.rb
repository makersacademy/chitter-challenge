feature 'User sign in' do
  let(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario 'with incorrect password' do
    sign_in(email: user.email,   password: '1234')
    expect(page).to have_content "The email or password is incorrect"
  end

  scenario 'with incorrect email' do
    sign_in(email: 'wrong',   password: user.password)
    expect(page).to have_content "The email or password is incorrect"
  end
end
