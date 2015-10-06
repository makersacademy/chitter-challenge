module SessionHelpers

  def sign_up_as(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username,              with: user.username
    fill_in :password,              with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  def sign_in(user)
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

end
