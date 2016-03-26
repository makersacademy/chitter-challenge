feature 'User signs in' do

  let(:user) do
    User.create(name: 'user',
                email: 'user@example.com',
                username: 'user',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username,   password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.username, 'wrong_password')).to be_nil
end

end