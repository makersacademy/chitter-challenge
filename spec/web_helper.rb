def post_a_chit(text)
  visit '/chits/new'
  fill_in :message, with: text
  click_button 'Chit'
end

def sign_up(username: 'tester', email: 'test@mail.com', password: 'password')
  visit '/signup'
  fill_in :username, with: username
  fill_in :email,    with: email
  fill_in :password, with: password
  click_button 'Sign Up'
end
