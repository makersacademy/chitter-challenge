module SessionHelpers

  def sign_up(name: 'Chris', username: 'Wynndow',
              email: 'chris.wynndow@gmail.com', password: 'password',
              password_confirmation: 'password')
    visit('/users/new')
    expect(page.status_code).to eq 200
    fill_in(:name, with: name)
    fill_in(:username, with: username)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirmation, with: password_confirmation)
    click_button('Submit')
  end

  def log_in(email: 'chris.wynndow@gmail.com', password: 'password')
    visit('/sessions/new')
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    click_button('Log in')
  end

end
