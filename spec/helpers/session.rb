module SessionHelpers

  def sign_in(email: 'alice@example.com', password: 'password')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(email: 'alice@example.com', handle: 'alice241', password: 'password', password_confirmation: 'password')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :handle, with: handle
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
