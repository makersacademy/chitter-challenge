feature 'User sign in' do

  let!(:user) do
    User.create(email: 'cat@cat.com',
                name: 'saucy cat',
                username: 'cat',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome #{user.username}"
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
