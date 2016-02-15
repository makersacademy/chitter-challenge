
 def sign_up(email: "example@ymail.com",
             password: "sup£rs3cret",
             password_confirmation: "sup£rs3cret",
             name: "Marco Bagnasco",
             username: "Me")
             visit '/users/new'
             expect(page.status_code).to eq 200
             fill_in :email, with: email
             fill_in :password, with: password
             fill_in :password_confirmation, with: password_confirmation
             fill_in :name, with: name
             fill_in :username, with: username
             click_button "Sign Up"
 end
 
 def sign_in
   fill_in :email, with: "example@ymail.com"
   fill_in :password, with: "sup£rs3cret"
   click_button "Sign In"
 end
 
 
 def sign_out
   click_button "Sign Out"
 end