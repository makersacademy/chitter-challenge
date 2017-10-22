module SessionHelpers
  def sign_up(email: 'olivia@example.com',
          password: '12345678',
          password_confirmation: '12345678')
    visit'/makers/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def sign_in(email: 'olivia@example.com',
              password: '12345678')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
