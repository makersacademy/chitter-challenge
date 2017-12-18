feature 'Logging out' do
  scenario 'User can logout' do
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'name', with: "Test Name"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Create Account'
    click_on "Logout"
    expect(page).to_not have_content("Logged in")
  end
end
