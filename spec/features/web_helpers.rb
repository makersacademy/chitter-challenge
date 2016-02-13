# User spec helpers
module UserHelpers
  def sign_up(
    username: 'amanzano', password: 'pass', password_confirmation: 'pass',
    email: 'arnold@myemail.com', name: 'Arnold Manzano')
    visit '/users/new'
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :email, with: email
    fill_in :name, with: name
    click_button 'Sign up'
  end
end
