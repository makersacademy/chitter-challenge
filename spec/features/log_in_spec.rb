feature "Feed" do
  scenario 'user can see a feed area' do

  visit('/')
  fill_in "username", with: "user1"
  fill_in "password", with: "pass"
  click_button "Sign in"

  expect(page).to have_content "See what your peeps are up to!"

  end
end
