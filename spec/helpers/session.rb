module SessionHelpers

  def sign_up
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in(:name, with: 'Emily')
    fill_in(:username, with: 'emchai')
    fill_in(:email, with: 'echai93@gmail.com')
    fill_in(:password, with: 'brocolli')
    fill_in(:password_confirmation, with: 'brocolli')
    click_button 'Sign up'
  end

  def log_in
    visit '/sessions/new'
    fill_in(:username, with: 'emchai')
    fill_in(:password, with: 'brocolli')
    click_button 'Log in'
  end

end
