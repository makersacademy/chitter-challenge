feature 'logging out' do
  scenario 'signed in user can log out' do
    User.create(name: 'user', email: 'user@email.com', password: 'password',
     password_confirmation: 'password')
    log_in(email: 'user@email.com', password: 'password')
    click_button('Log out')
    expect(page).to have_content('Goodbye!')
  end


end
