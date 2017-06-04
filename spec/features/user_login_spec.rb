feature 'user log in and out' do
  let!(:user) do
    User.create(email: 'kavita@example.com',
                password: 'makers',
                password_confirmation: 'makers',
                name: 'Kavita',
                username: 'kkavita92')
  end

  scenario 'user can log in with right password' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  scenario 'user cannot log in with wrong password' do
    log_in(email: user.email, password: :wrong)
    expect(page).to have_content 'The email or password is incorrect'
  end

  scenario 'user cannot log in with wrong username' do
    log_in(email: :wrong, password: user.password)
    expect(page).to have_content 'The email or password is incorrect'
  end
end
