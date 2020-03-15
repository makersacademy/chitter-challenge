def create_peep
  visit('/new')
  fill_in('content', with: "this is a test peep")
  click_button("Submit")
end

def register
  visit('/register')
  fill_in('username', with: "testusername")
  fill_in('email', with: 'testemail@gmail.com')
  fill_in('name', with: 'testname')
  fill_in('password', with: 'testpassword')
  click_button("Register")
end

def login
  @user = User.create(name: "testname", username: "testusername", password: "testpassword", email: "testemail")
  visit('/login')
  fill_in('email', with: "testemail")
  fill_in('password', with: "testpassword")
  click_button("Login")
end
