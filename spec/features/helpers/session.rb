module SessionHelpers

  def sign_up(name: "Bob", username: "bob89",
              email: "bob@email.com", password: "password",
              confirmation: "password")
    visit '/sign_up/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :confirmation, with: confirmation
    click_button 'Sign up'
  end

  def john_signs_up
    sign_up(username: "john89",
            name: "John",
            email: "john@email.com")
  end

  def log_in(username, password)
    visit '/log_in/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Log in'
  end

  def reset_password_form(email = 'bob@example.com')
    visit '/reset_password'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    click_button 'Request token'
  end

  def change_password_form(password = 'password',
                           confirmation = 'password')
    fill_in :password, with: password
    fill_in :confirmation, with: confirmation
    click_button 'Change password'
  end

end