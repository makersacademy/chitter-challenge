module SessionHelpers

  def sign_in(username: 'Wizard_Trish', password: 'password')
    visit '/sessions/new'
    fill_in(:username, with: username)
    fill_in(:password, with: password)
    click_button('Sign in')
  end

  def sign_up(email: 'Trisha@person.com',
              username: 'Wizard_Trish',
              password: 'password',
              password_confirmation: 'password')
    visit '/users/new'
    fill_in(:name, with: 'Trisha')
    fill_in(:email, with: email)
    fill_in(:username, with: username)
    fill_in(:password, with: password)
    fill_in(:password_confirmation, with: password_confirmation)
    click_button('Sign up')
  end

end
