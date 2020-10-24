def sign_up
  visit('/users/new')
  fill_in :name, with: "John Smith"
  fill_in :username, with: "JSmith"
  fill_in :email, with: "testing@testmail.com"
  fill_in :password, with: "Rosebud"
  click_button "Sign Up"
end

def create_karen
  User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
  visit '/chitter/sessions/new'
end
