module SessionHelpers

  def sign_up(  email: 'user1@users.com',  name:                   'User Name',
                username:        'user1',  password_confirmation: 'password01',
                password:   'password01' )
    visit('/users/new')
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Submit')
  end

end
