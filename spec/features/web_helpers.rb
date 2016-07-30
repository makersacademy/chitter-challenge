def sign_up(username: "arukomp",
            name: "Arunas Skirius",
            email: "arukomp@gmail.com",
            password: "pass1234",
            password_confirmation: "pass1234")
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
