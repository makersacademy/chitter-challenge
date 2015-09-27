module SessionHelpers

  def sign_up(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: user.email
    fill_in :handle, with: user.handle
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  def sign_in(handle:, password:)
    visit 'sessions/new'
    fill_in :handle, with: user.handle
    fill_in :password, with: user.password
    click_button 'Sign In'
  end

end
