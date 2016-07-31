feature 'User signs in' do
  let!(:user) do
    User.create(username: 'mike', password: 'backtothefuture', password_confirmation: 'backtothefuture', firstname: 'Michael', surname: 'Fox', email: 'mjf@backtothefuture.com')
  end

  scenario 'I can sign in with correct credentials' do
    signin(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
