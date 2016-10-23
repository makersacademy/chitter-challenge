module SessionHelpers
  def sign_up(username: 'Daisy123',
              first_name: 'Daisy',
              last_name: 'Humphrey',
              email: 'daisy@awesome.com',
              password: 'password',
              password_confirmation: 'password')
    visit '/users/new'
    fill_in :username, with: username
    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
