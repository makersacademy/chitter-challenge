feature 'logging in' do

  scenario 'user logs in correctly' do
      User.create(name: 'user', email: 'user@email.com', password: 'password',
       password_confirmation: 'password')
       log_in(email:'user@email.com',password:'password')
       expect(page).to have_content('user, you are logged in')
       expect{log_in(email:'user@email.com',password:'password')}.not_to change(User, :count)
  end

  scenario 'user logs in without existing account with email' do
    log_in(email:'random@email.com',password:'password')
    expect(page).to have_content('error')

    expect{log_in(email:'random@email.com',password:'password')}.not_to change(User, :count)
  end
end
