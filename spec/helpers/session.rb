module SessionHelpers
  def sign_up(name: 'Iryna',
            username: 'irisha',
            email: 'iryna@mail.com',
            password: 'chitter!',
            password_confirmation: 'chitter!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: name
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def log_in(email, password)
      visit '/sessions/new'
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Log in'
  end
end