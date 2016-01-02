module SessionHelpers
  def sign_up(email: 'testemail@example.com',
              username: 'testuser',
              name: 'Test User',
              password: 'password_duh',
              password_confirmation: 'password_duh')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Create Account!'
  end

  def create_user
    User.create(email: 'testemail@example.com',
                username: 'testuser',
                name: 'Test User',
                password: 'password_duh',
                password_confirmation: 'password_duh')
  end
end
