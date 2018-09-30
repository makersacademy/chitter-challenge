def happy_login
  visit("/")
  fill_in 'username', with: "Aeris"
  fill_in 'password', with: "ihateswords"
  click_button('Login!')
end

def signup_navigation
  visit("/")
  click_button('Sign up!')
end


def happy_signup
  fill_in 'username', with: "Aeris"
  fill_in 'email', with: "oopsiperishedagain@gmail.com"
  fill_in 'password', with: "ihateswords"
  fill_in 'password-confirm', with: "ihateswords"
  click_button('Sign me up!')
end

def enter_same_email
  fill_in 'username', with: "Cloud"
  fill_in 'email', with: "oopsiperishedagain@gmail.com"
  fill_in 'password', with: "spikesarecool"
  fill_in 'password-confirm', with: "spikesarecool"
  click_button('Sign me up!')
end

def enter_same_username
  fill_in 'username', with: "Aeris"
  fill_in 'email', with: "whereisbarrett@gmail.com"
  fill_in 'password', with: "spikesarecool"
  fill_in 'password-confirm', with: "spikesarecool"
  click_button('Sign me up!')
end

def clean_database
  Message.all.destroy
  User.all.destroy
end
