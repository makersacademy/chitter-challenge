module SessionHelpers
  def sign_in(email:, password:)
    visit('/sessions/new')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Sign in')
  end

  def sign_up(username: 'DizzyUnicorn', email: 'dizzy@unicorn.com', password: 'rainbow123', password_confirmation: 'rainbow123')
    visit('/users/new')
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign up')
  end
end
