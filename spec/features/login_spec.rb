feature 'logging in' do
  scenario 'User can login with correct details' do
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'name', with: "Test Name"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    visit '/login'
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    click_on "Login"
    expect(page).to have_content("Logged in as: TestUserName")
  end
end
