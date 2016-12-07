module Helpers

  def sign_up(user)
    visit '/users/new'
    fill_in('username', with: user.username)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password_digest)
    fill_in('password_confirmation', with: user.password_digest)
    click_button('Submit')
  end

  def sign_in(user)
    visit '/sessions/new'
    fill_in('username', with: user.username)
    fill_in('password', with: user.password_digest)
    click_button('Submit')
  end

  def post_message(message)
    visit '/messages/new'
    fill_in('new_message', with: message)
    click_button('Chirp!')
  end
end
