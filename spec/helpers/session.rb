module SessionHelpers

  def sign_up
    visit('/')
    fill_in :email, with: 'user1@users.com'
    fill_in :name, with: 'User Name'
    fill_in :username, with: 'user1'
    fill_in :password, with: 'password01'
    cick_button('Submit')
  end
