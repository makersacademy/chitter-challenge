module Helpers

  def sign_up(user)
    visit('/users/new')
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    fill_in('password_confirmation', with: user.password_confirmation)
    fill_in('name', with: user.name)
    fill_in('user_name', with: user.user_name)
    click_button('Register')
  end

  def sign_in(user)
    visit('/sessions/new')
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_button('Log in')
  end

  def create_peep(message)
    visit('peeps/new')
    fill_in('peep', with: message)
    click_button('Peep')
  end

end
