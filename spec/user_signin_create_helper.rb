def create_user
  User.create(name: 'Amy Jordan', username: 'amy123', email: 'amy@testemail.com', password: 'password')
end

def sign_in
  visit('/chitter')
  click_button('Sign in')
  fill_in('username', with: 'amy123')
  fill_in('password', with: 'password')
  click_button('Sign in')
end
