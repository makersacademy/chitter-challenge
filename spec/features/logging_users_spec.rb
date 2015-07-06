feature 'Logging in user\'s' do

  let(:user) do
    create(:user)
  end

  scenario 'must have correct credentials' do
    log_in(user)
    expect(page).to have_content "#{user.username}"
  end

  scenario 'can\'t log in with the wrong username' do
    user = build(:user, username: 'Goo')
    log_in(user)
    expect(page).to have_content('username or password is incorrect')
  end

  scenario 'can log out once signed in' do
    log_in(user)
    click_button 'Log out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('#{user.username}')
  end
end