def sign_up
  visit "/"
  within "form#sign_up" do
    click_button "Sign Up"
  end
  expect(current_path).to eq "/signup"
  expect(page.status_code).to eq 200
  within("div#signup") do
    fill_in("email", with: "ladymacbeth@dunsinane.com")
    fill_in("password", with: "damn3dSp0t")
    fill_in("username", with: "LadyMacker123")
    click_button "submit"
  end
  expect(current_path).to eq "/"
  expect(page.status_code).to eq 200
end

def sign_in
  visit "/"
  within "form#sign_in" do
    click_button "Sign In"
  end
  expect(current_path).to eq "/sign-in"
  expect(page.status_code).to eq 200
  fill_in("username", with: "LadyMacker123")
  fill_in("password", with: "damn3dSp0t")
  click_button "submit"
  expect(current_path).to eq "/"
  expect(page.status_code).to eq 200
end
