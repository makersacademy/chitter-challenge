module SessionHelpers

  def sign_up(username: 'toby',
              name: 'Toby Muir-Little',
              email: 'toby@fish.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
