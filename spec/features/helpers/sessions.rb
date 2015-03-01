module SessionHelpers

 def sign_in(email,password)
      visit '/sessions/new'
      fill_in "email", :with => email
      fill_in "password", :with => password
      click_button "Sign in"
    end

 def sign_up(email = "johndoe@test.com",
                password = "qwerty",
                username = "jdoe")
      visit '/users/new'
      fill_in :email, :with => email
      fill_in :password, :with => password
      fill_in :username, :with => username
      click_button "Sign up"
    end
end