def sign_up(email: "test@test.com", password: "password", password_confirmation: "password")
  visit('/')
  find(:css, "a[href='/users/new']").click
  #fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Submit')
end

def sign_up_and_login
  sign_up
  find(:css, "a[href='/sessions/new']").click
  fill_in('email', with: "test@test.com")
  fill_in('password', with: "password")
  click_button('Log in')
end

def peep(string)
  fill_in('comment', with: string)
  click_button('Submit')
end

def generate_string(char_no)
  "a" * char_no
end
