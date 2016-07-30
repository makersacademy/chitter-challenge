feature 'User signs out' do
  let!(:user) do
    User.create(username: 'mike', password: 'backtothefuture', password_confirmation: 'backtothefuture', firstname: 'Michael', surname: 'Fox', email: 'mjf@backtothefuture.com')
  end

  scenario 'while being signed in' do
    sign_in(username: user.username, password: user.password)
    click_button 'sign out'
    expect(page).to have_content('You have signed out. Goodbye!')
    expect(page).not_to have_content "Welcome, mike"
  end
end
