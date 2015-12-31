module SessionHelpers
  def sign_up(name: 'Username', username: 'nickname',
              email: 'user_name@email.com',
              password: 'secret_password',
              password_confirmation: 'secret_password')

    visit '/users/new'
    expect(page.status_code).to eq(200)

    fill_in 'name', with: name
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation

    click_button 'Sign up'
  end
end
