module Helpers
  def sign_up(user)
    visit '/user/new'
    fill_in :username, with: user.username
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign Up'
  end

  def sign_in(user)
    visit 'sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign In'
  end

  def post_peep(user, content)
    sign_in(user)
    visit '/peep/new'
    fill_in 'content', with: content
    click_button 'Post'
  end
end
