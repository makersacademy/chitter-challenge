module SessionHelpers

  def sign_up(email: 'newuser@gmail.com',
              password: 'password123',
              password_confirmation: 'password123',
              username: 'newnew',
              name: 'mew')
      visit '/users/new'
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      fill_in :username, with: username
      fill_in :name, with: name
      click_button 'Submit'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
