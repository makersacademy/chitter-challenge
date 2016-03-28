def sign_up
  visit ('/users/new')
  fill_in(:name, with: "Sachin Karia")
  fill_in(:email, with: "sachin.karia01@gmail.com")
  fill_in(:username, with: "sachinkaria")
  fill_in(:password, with: "password")
  fill_in(:password_confirmation, with: "password")
  click_button("Sign Up")
end

def sign_up_incorrect_password
  visit ('/users/new')
  fill_in(:name, with: "Sachin Karia")
  fill_in(:email, with: "sachin.karia01@gmail.com")
  fill_in(:username, with: "sachinkaria")
  fill_in(:password, with: "password")
  fill_in(:password_confirmation, with: "wrong")
  click_button("Sign Up")
end

def sign_up_invalid_email
  visit ('/users/new')
  fill_in(:name, with: "Sachin Karia")
  fill_in(:email, with: "sachin.karia01gma")
  fill_in(:username, with: "sachinkaria")
  fill_in(:password, with: "password")
  fill_in(:password_confirmation, with: "password")
  click_button("Sign Up")
end

def sign_up_without_email
  visit ('/users/new')
  fill_in(:name, with: "Sachin Karia")
  fill_in(:email, with: "")
  fill_in(:username, with: "sachinkaria")
  fill_in(:password, with: "password")
  fill_in(:password_confirmation, with: "password")
  click_button("Sign Up")
end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in(:username, with: "sachinkaria")
    fill_in(:password, with: "password")
    click_button 'Sign in'
  end

def new_peep
  visit '/peeps'
  fill_in(:message, with: "This is a test peep")
  click_button 'Post peep'
end
