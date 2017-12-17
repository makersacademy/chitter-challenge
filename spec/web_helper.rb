def sign_up
  visit("/users/new")
  expect(page.status_code).to eq(200)
  fill_in :name,                  with: "John Smith"
  fill_in :username,              with: "John"
  fill_in :email,                 with: "john@gmail.com"
  fill_in :password,              with: "12345"
  fill_in :password_confirmation, with: "12345"
  click_button "Sign up"
end

def post_a_peep
  visit("/peeps/new")
  fill_in :message, with: "My first peep!"
  click_button("Post")
end
