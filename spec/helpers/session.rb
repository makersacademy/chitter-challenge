module SessionHelpers

  def sign_up(name: 'New User',
              username: 'whoami',
              email: 'user@email.com',
              password: 'password',
              password_confirm: 'password')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirm', with: password_confirm)
    click_button 'Submit'
  end

  def sign_in(email: 'user@email.com', password: 'password')
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button 'Log in'
  end

  def recover_password
    visit '/users/recover'
    fill_in :email, with: "user@email.com"
    click_button "Submit"
  end

  def set_new_password(password: 'newpassword', password_confirmation: 'newpassword')
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Submit"
  end

end
