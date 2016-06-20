feature 'User sign in' do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'test',
                password_confirmation: 'test', username: 'test', name: 'test')
  end

  scenario 'with correct credentials' do
    signin(email: user.email, password: user.password)
    expect(page).to have_content "Why don't you go ahead and write a new peep"
  end

  scenario 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  scenario 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

end
