module SessionHelpers

  def sign_up
    user = build :user
    visit '/'
    click_link 'Sign up'
    fill_in :email, with: user.email
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'Sign up'
  end

  def sign_in
    sign_up
    user = build :user
    visit '/'
    click_link 'Sign in'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'Sign in'
  end

end
