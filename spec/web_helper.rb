def sign_up(name: "Will Smith", email: "wsmith@gmail.com", user_name: "William", password: "123456", password_confirmation: "123456")
  visit '/user/new'
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('user_name', with: user_name)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign up')
end

def sign_up_with_missing_email
  visit '/user/new'
  fill_in('name', with: "Jacob")
  fill_in('user_name', with: "Jacobb")
  fill_in('password', with: "password")
  fill_in('password_confirmation', with: "password")
end
