def logintopage
  visit '/'
    fill_in'Email', with: "test@test.com"
    fill_in'Password', with: "test123"
    click_button("Log in")
end