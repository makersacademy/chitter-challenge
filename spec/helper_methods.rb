def sign_up_1
  click_button "Sign Up"
  fill_in(:username, with: "user1")
  fill_in(:password, with: "password1")
  fill_in(:name, with: "Mr User")
  fill_in(:email, with: "user1@example.com")
  click_button "Submit"
end

def sign_up_2
  click_button "Sign Up"
  fill_in(:username, with: "user2")
  fill_in(:password, with: "password2")
  fill_in(:name, with: "Mrs User")
  fill_in(:email, with: "user2@example.com")
  click_button "Submit"
end

def create_peeps
  @peep_one = Peep.create(username: "user1", content: "content1")
  @peep_two = Peep.create(username: "user1", content: "content2")
  visit '/'
end
