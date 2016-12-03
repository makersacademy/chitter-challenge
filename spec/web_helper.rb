def cat_sign_up
  visit('/')
  click_button "Sign up"
  fill_in :name, with: "cat"
  fill_in :username, with: "CAT"
  fill_in :email, with: "cat@email.com"
  fill_in :password, with: "catsecret"
  fill_in :password_confirmation, with: "catsecret"
  click_button "Submit"
end

def dog_sign_up
  visit('/')
  click_button "Sign up"
  fill_in :name, with: "dog"
  fill_in :username, with: "DOG"
  fill_in :email, with: "dog@email.com"
  fill_in :password, with: "dogsecret"
  fill_in :password_confirmation, with: "dogsecret"
  click_button "Submit"
end

def cat_log_in
  visit('/')
  click_button "Log in"
  fill_in(:email, with: "cat@email.com")
  fill_in(:password, with: "catsecret")
  click_button "Submit"
end
