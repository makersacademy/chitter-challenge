# def sign_up
#   visit '/users/new'
#   expect(page.status_code).to eq 200
#   fill_in :name, with: 'Jean Tremblay'
#   fill_in :username, with: 'jt14'
#   fill_in :email, with: 'jean@example.com'
#   fill_in :password, with: 'trout'
#   click_button 'Sign up'
# end

def sign_up(name: 'Jean Tremblay',
                         username: 'jt14',
                         email: 'jean@example.com',
                         password:'trout',
                         password_confirmation: 'trout')
  visit 'users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
