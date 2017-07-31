module SessionHelpers
  def sign_in(email_or_username: 'george@curious.com', password: 'yellow_hat')
    visit('/sessions/new')
    fill_in 'email_or_username',      with: email_or_username
    fill_in 'password',               with: password
    click_button 'Sign In'
  end
end
