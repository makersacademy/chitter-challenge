
def sign_up (full_name: "Donald J. Trump",
             user_name: "realDonaldTrump",
             email: "scumlord@potus.com",
             password: "the best passwords",
             password_confirmation: "the best passwords")
  visit "/"
  click_link "new user"
  fill_in :full_name, with: full_name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "sign up"
end
