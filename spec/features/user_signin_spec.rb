feature 'User signs in' do
  let!(:user) do
    User.create(username: 'mike', password: 'backtothefuture', password_confirmation: 'backtothefuture', firstname: 'Michael', surname: 'Fox', email: 'mjf@backtothefuture.com')
  end

  scenario 'I can sign in with correct credentials' do
    signin(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'I cannot sign in with incorrect credentials' do
    signin(username: user.username, password: "wrongpassword")
    expect(page).not_to have_content "Welcome, #{user.username}"
  end

  scenario 'I should not see sign in page while I am signed in' do
    signin(username: user.username, password: user.password)
    visit '/sessions/new'
    expect(page).not_to have_content "Please sign in"
  end
end
