module SessionHelpers

  def sign_up(email = 'bo@bo.com',
              password = 'bo',
              password_confirmation = 'bo')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def login(email, password)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign in'
  end

  def logout
    click_button 'Logout'
  end
end
