module SessionHelpers

  def sign_up(email: 'user1@users.com',  name:                   'User Name',
              username:        'user1',  password_confirmation: 'password01',
              password:   'password01')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_in(username: 'user1', password: 'password01')
    sign_up
    visit '/peeps'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Login'
  end

  def make_peep(message: 'Test peep 01')
    fill_in :message, with: message
    click_button 'Peep!'
  end

end
