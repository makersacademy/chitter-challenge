def register_for_chitter
  visit('/users/new')
  fill_in("name", with: "Maurice Bendrix")
  fill_in("username", with: "mauribendrix")
  fill_in("email", with: "mauribendrix@gmail.com")
  fill_in("password", with: "ilovesarah")
  click_button('Sign Up')
  visit('/users/new')
  fill_in("name", with: "Sarah Miles")
  fill_in("username", with: "smiles")
  fill_in("email", with: "sarahmiles@gmail.com")
  fill_in("password", with: "ilovemauri")
  click_button('Sign Up')
end
