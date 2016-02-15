module SessionHelpers

  def sign_up
    visit '/homepage'
    click_button 'Sign up'
    fill_in('Username',   with: 'username')
    fill_in('E-mail',     with: 'user@example.com')
    fill_in('Password',   with: 'password')
    click_button 'Register'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email,    with: 'user@example.com'
    fill_in :password, with: 'password'
    click_button 'Login'
  end

end
