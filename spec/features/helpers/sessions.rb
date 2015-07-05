module SessionHelpers

  def register(user)
    visit '/user/register'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    fill_in :username, with: user.username
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up for Chitter'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email,    with: :email
    fill_in :password, with: :password
    click_button 'Log in'
  end

end