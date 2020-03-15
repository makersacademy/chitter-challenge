def create_peep
  visit('/new')
  fill_in('content', with: "this is a test peep")
  click_button("Submit")
end

def login
  visit('/login')
  fill_in('username', with: "testusername")
  fill_in('email', with: 'testemail@gmail.com')
  fill_in('name', with: 'testname')
  fill_in('password', with: 'testpassword')
  click_button("Submit")
end
