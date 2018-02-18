feature 'Signing in' do
  scenario 'user signs in to post peeps' do
    visit '/users/new'
    fill_in "email", with: "timmygogo@gmail.com"
    fill_in "password", with: "password1"
    click_button "Sign In"
    expect(page).to have_content "Hello, timmygogo@gmail.com"
  end
end
