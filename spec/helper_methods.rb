def sign_up
  click_button "Sign Up"
  fill_in(:username, with: "user1")
  fill_in(:password, with: "password1")
  fill_in(:name, with: "Mr User")
  fill_in(:email, with: "user1@example.com")
  click_button "Submit"
end

def create_peeps
  @peep_one = Peep.create(username: "user1", content: "content1")
  @peep_two = Peep.create(username: "user1", content: "content2")
  visit '/'
end
