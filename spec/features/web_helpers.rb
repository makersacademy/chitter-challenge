def sign_up(username: "joedoe",
            name: "Joe Doe",
            email: "joedoe@example.com",
            password: "notjoe",
            password_confirmation: "notjoe")
  visit '/users/new'
  fill_in :username, with: username
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign Up"
end

def sign_in(username: "joedoe", password: "notjoe")
  visit '/sessions/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button "Log In"
end

def peep(message: "Example message")
  fill_in :message, with: message
  click_button "Peep!"
end
