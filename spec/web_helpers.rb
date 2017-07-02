def sign_up
  visit '/signup'
  fill_in(:email, with: "john@gmail.com" )
  fill_in(:password, with: "password123" )
  fill_in(:username, with: "goober")
  click_button( 'Start Peeping!')
end
