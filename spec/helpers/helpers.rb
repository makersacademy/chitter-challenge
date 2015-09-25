module SessionHelpers
  def sign_up_as(user)
    visit('/users/new')
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    fill_in('name', with: user.name)
    fill_in('username', with: user.username)
    fill_in('password_confirmation', with: user.password_confirmation)
    click_button('Register')
  end

  def sign_in_as(user)
    visit('/sessions/login')
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_button('Login')
  end
end