#
def sign_up
  visit "/sign_up"
  fill_in :email, with: "jenniferbacon@hotmail.com"
  fill_in :password, with: "secret"
  fill_in :name, with: "Jennifer Bacon"
  fill_in :username, with: "jennyb"
  click_button("Sign up")
end
