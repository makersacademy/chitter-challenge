module Login
  def sign_up(username: 'faisal',
              email: 'faisal@gmail.com')
    visit '/user/new'
    fill_in :username, with: username
    fill_in :email, with: email
    click_button 'Sign up'
  end
end
