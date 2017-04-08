module SessionHelpers

  def signup(email: 'happyfriends@treehouse.com', username: 'HappyFriends99', password: 'password1234', password_confirmation: 'password1234')
    visit('/users/new')
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'submit'
  end

  def login(username: 'HappyFriends99', password: 'password1234', password_confirmation: 'password1234')
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign In'
  end
end
