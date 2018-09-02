def submit_peep
  fill_in 'new_peep', with: "This is the first post."
  click_button 'Submit'
end

def sign_up
  visit("/")
  click_link "Sign-up"

  fill_in "email", with: "ab@cd.com"
  fill_in "name", with: "TestName"
  fill_in "username", with: "Test666"
  fill_in "password", with: "123456"

  click_button "Sign-up"
end 