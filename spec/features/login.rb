module Login
  def sign_up(username: 'faisal',
              email: 'faisal@gmail.com',
              password: 'burgerking',
              password_confirmation: 'burgerking')
    visit '/user/new'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def peep
    sign_in(email: 'faisal@gmail.com', password: 'burgerking')
    visit '/peep/new'
    fill_in :peep, with: 'Hello, from London'
    click_button 'peep'
  end
end
