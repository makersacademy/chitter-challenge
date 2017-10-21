def sign_up
  visit "/"
  click_link "signup_link"
  expect(current_path).to eq "/signup"
  expect(page.status_code).to eq 200
  within("div#signup") do
    fill_in("email", with: "ladymacbeth@dunsinane.com")
    fill_in("password", with: "damn3dSp0t")
    fill_in("username", with: "LadyMacker123")
    click_button "submit"
  end
end
