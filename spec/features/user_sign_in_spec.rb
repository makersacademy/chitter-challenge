feature 'Signing in of registered user' do

  let(:user) do
    User.create(name: 'User McUser',
    username: 'alias',
    email: 'user@example.com',
    password: 'secret1234',
    password_confirmation: 'secret1234')
  end

  scenario 'Valid credentials' do
    sign_in(user.email, user.password)
    expect(page).to have_content 'alias'
  end

  scenario 'Invalid credentials' do
    sign_in(user.email, 'BAD_PASSWORD')
    expect(page).to have_content 'The email or password is incorrect'
  end
end
