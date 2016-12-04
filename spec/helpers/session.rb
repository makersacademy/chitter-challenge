module SessionHelpers

  def sign_up(name: 'John Smith',
              email: 'jsmith@gmail.com',
              username: 'jsmith2016',
              password: 'pizza123!',
              password_confirmation: 'pizza123!')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(username:, password:)
    visit '/session/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button "Sign in"
  end

end
