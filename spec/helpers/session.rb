module SessionHelpers

  def sign_up(name: 'Peter Jackson', username: 'pjackson', email: 'jackie@zmail.org', 
              password: '123456', password_confirmation: '123456' )
    visit '/users/new'
    fill_in 'name', with: name 
    fill_in 'username', with: username 
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button('Sign up for Chitter')
  end

  def log_in(email: 'jackie@zmail.org', password: '123456')
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button('Log in') 
  end

  def log_out
    click_button('Sign out')
  end

  def peep(message: 'My first peep')
    visit '/message/new'
    fill_in 'message', with: message
    click_button('Peep')
  end

end
