module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(email: 'freddy@chillvibes.com', password: 'staychill22')
    visit 'users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Register'
  end

end
