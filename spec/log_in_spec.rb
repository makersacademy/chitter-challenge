feature 'Logging in to Chitter' do
  let!(:user) do
    User.create(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')
  end

  scenario 'An already registered user can log in' do
    log_in(user.username, user.password)
    expect(page).to have_content "Welcome back #{user.username}"
  end

  scenario 'An unregisted user cannot log in' do
    log_in('Hannah', 'hiya')
    expect(page).not_to have_content "Welcome back Hannah!"
    expect(page).to have_content "Either you've not signed up, or your password is wrong"
  end

  scenario 'A registered user cannot log in with the wrong password' do
    log_in(user.username, 'wrong')
    expect(page).to have_content "Either you've not signed up, or your password is wrong"
  end
end
