feature 'User sign in' do

  let!(:user) do
    User.create(email: 'user@example.com',
      username: 'example',
      password: 'secret1234',
      password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: 'user@example.com', password: 'secret1234')
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
  end

  scenario 'with incorrect credentials' do
    sign_in(email: 'user@example.com', password: 'wrong_password')
    expect(page).to have_content "Your email or password is incorrect"
  end

end
