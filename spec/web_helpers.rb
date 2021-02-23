def go_to_index_page_and_register_a_new_user
  visit "/"

  click_button "Join Chitter"
  expect(current_path).to eq "/new_user"

  fill_in "email", with: "test@test.com"
  fill_in "real_name", with: "R Name"
  fill_in "username", with: "tester"
  fill_in "password", with: "password123"
  click_button "Register"
end

def successful_sign_in
  click_button "Sign in"
  fill_in "email", with: "test@test.com"
  fill_in "password", with: "password123"
  click_button "Sign in"
end

def submit_a_post
  fill_in "post[text]", with: "writing a peep"
  click_button "Peep!"
end

def submit_another_post
  fill_in "post[text]", with: "second peep"
  click_button "Peep!"
end