
module SessionHelpers

  def sign_in(email:, password:)
    visit '/session/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(email: 'test@example.com',
              user_name: 'test1',
                password: '12345678',
                password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email,     with: email
    fill_in :password,  with: password
    fill_in :user_name, with: user_name
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
