def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in("name", with: "Marco")
  fill_in("username", with: "Asensio")
  fill_in("email", with: "asensio@example.es")
  fill_in("password", with: "only3m")
  click_button 'Submit'
end