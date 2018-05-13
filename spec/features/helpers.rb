module Helpers
  def new_peep(text)
    click_link('New peep')
    fill_in('peep', with: "#{text}")
    click_button('Submit')
  end

  def new_user(email, password, name, username)
    click_link('Sign up')
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('name', with: name)
    fill_in('username', with: username)
    click_button('Submit')
  end

  def log_in(username, password)
    fill_in('username', with: username)
    fill_in('password', with: password)
    click_button('Log in')
  end
end
