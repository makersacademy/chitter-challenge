
def sign_up(name: "a name", email: "an email", username: "a username", password: "a password")
  visit('/sign_up')

  fill_in "name", with: name
  fill_in "email", with: email
  fill_in "username", with: username
  fill_in "password", with: password
  click_button 'Sign Up'
end

def post(peep:)
  visit('/')

  fill_in "peep", with: peep
  click_button 'Post peep!'
end
