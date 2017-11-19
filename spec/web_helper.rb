@username = 'Jamie Lem'
@email = "email@email.com"
@password = 'passw0rd'

def signup
  visit '/'
  click_button('Signup')
  expect(page.status_code).to eq(200)
  fill_in('signup_name', with: @name)
  fill_in('signup_email', with: @email)
  fill_in('signup_password', with: @password)
  fill_in('confirm_password', with: @password)
  click_button('Signup')
end

def login
  visit '/'
  click_button('Login')
  expect(page.status_code).to eq(200)
  fill_in('login_email', with: @email)
  fill_in('login_password', with: @password)
  click_button('Login')
end
