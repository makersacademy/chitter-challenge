def sign_up_user
  visit('/sign_up')
  fill_in('name', with: 'Chloe Verity')
  fill_in "username", with: "chloeverity123"
  fill_in "emailaddress", with: "chloeverity123@gmail.com"
  fill_in "password", with: "ilovemrcuddles"
  click_button "Sign Me Up"
end
