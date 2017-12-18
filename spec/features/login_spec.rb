feature 'logging in' do
  scenario 'User can login with correct details' do
    visit '/users/new'
    register_account
    visit '/login'
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    click_on "Login"
    expect(page).to have_content("Signed in as TestUserName")
  end
  scenario 'User cannot login with incorrect details' do
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'name', with: "Test Name"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Create Account'
    visit '/login'
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "badpassword"
    click_on "Login"
    expect(page).to have_content("Authentication failed")
  end
end
