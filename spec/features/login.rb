module Login
  def sign_up(username: 'faisal',
              email: 'faisal@gmail.com',
              password: 'burgerking')
    visit '/user/new'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end
end
