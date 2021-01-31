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