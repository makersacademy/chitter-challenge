def dummy_text
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed tempus diam. Quisque massa nunc."
end

def user_sign_up
  fill_in "firstname", with: "Sophie"
  fill_in "lastname", with: "Gilder"
  fill_in "email", with: "sophie.macramazing@gmail.com"
  fill_in "handle", with: "sophieg"
  fill_in "password", with: "password123"
  click_button "Register"
end 
