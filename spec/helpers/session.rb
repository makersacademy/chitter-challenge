module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(email: 'freddy@chillvibes.com', name: 'Freddy', username: 'doctoregg', password: 'staychill22')
    visit 'users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button 'Register'
  end

end
