def sign_in
  visit '/'
    click_button 'sign in'
    fill_in "Name", with: "Triceratops"
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "dinosaurpower"
    click_button "log in"
end