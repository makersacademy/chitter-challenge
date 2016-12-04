def login
  visit "/"
  expect(page.status_code).to eq(200)
  fill_in "email", :with => "keomony@gmail.com"
  fill_in "password", :with => "this is the password"
  click_button "Login" 
end
