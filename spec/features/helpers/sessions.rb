module SessionHelpers

  def sign_in(user_name, password)
    visit '/sessions/new'
    fill_in 'user_name', with: user_name
    fill_in 'password', with: password
    click_button 'Sign in'
  end

  def sign_up(user_name = 'Ed', email = 'ed@ed.com',
              password = '123', password_confirmation = '123')
    visit '/user/new'
    expect(page.status_code).to eq 200
    fill_in 'user_name', with: user_name
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'Register'
  end

  def reset_form(email = 'ed@ed.com')
    visit '/reset_password'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    click_button 'Request token'
  end

  def change_form(password = 'apples!',
                  password_confirmation = 'apples!')
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Reset password'
  end

end
