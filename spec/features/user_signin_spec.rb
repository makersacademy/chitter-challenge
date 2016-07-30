feature 'user sign in' do
  let!(:user) do
    User.create(username: 'mike', password: 'backtothefuture', password_confirmation: 'backtothefuture', firstname: 'Michael', surname: 'Fox', email: 'mjf@backtothefuture.com')
  end

def sign_in(username:, password:)
  visit '/sessions/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'sign in'
end

  scenario 'I can sign in with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
