 def sign_up
   visit '/users/new'
   expect(page.status_code).to eq 200
   fill_in "email", with: "example@ymail.com"
   fill_in "password", with: "sup£rs3cret"
   fill_in "name", with: "Marco Bagnasco"
   fill_in "username", with: "Smoodge "
   click_button "Sign Up"
 end