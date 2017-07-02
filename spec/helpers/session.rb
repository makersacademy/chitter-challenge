module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def new_user(email: 'example@example.com',
               name: 'Example Name',
               username: 'Example1',
               password: 'example_password',
               password_confirmation: 'example_password')
    visit ('/users/new')
    fill_in 'email', with: email
    fill_in 'name', with: name
    fill_in 'username', with: username
    fill_in 'password', with: password
    fill_in 'password confirmation', with: password_confirmation
    click_button 'Create account'
  end
end
