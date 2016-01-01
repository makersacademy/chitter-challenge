feature 'Logging out of Chitter' do
  let!(:user) do
    User.create(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')
  end

  scenario 'A logged in user can log out' do
    sign_up(user)
    log_in(user.username, user.password)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome back KS')
  end
end
