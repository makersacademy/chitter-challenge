feature "Sign in" do
  scenario 'user can sign in' do

  visit('/sign_in')
  fill_in "username", with: "user1"
  fill_in "password", with: "pass"
  click_button "Sign in"

  expect(page).to have_content "You are logged in as user1"

  end
end
