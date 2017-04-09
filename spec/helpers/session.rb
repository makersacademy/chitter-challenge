module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in('email', with: 'newbie@gmail.com')
    fill_in('nom_name', with: 'newbie')
    click_button('Sign up')
  end

  def sign_up_fail(email: 'newbie@gmail.com', password: '123', password_confirmation: '123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password, with: password_confirmation
    click_button 'Sign up'
  end

end
