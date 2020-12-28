module Helpers

  def sign_in(user)
    visit '/peeps'
    click_button('Sign in')
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    click_button('Sign in')
  end

  def sign_up(user)
    visit '/peeps'
    click_button('Sign up')
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    fill_in('name', with: 'rubberduck')
    click_button('Submit')
  end
end
