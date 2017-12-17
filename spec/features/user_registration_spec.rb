feature 'User registration' do
  scenario 'A user can register with valid data and is welcomed' do
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'name', with: "Test Name"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    expect(page).to have_content("Logged in as: TestUserName")
  end
  scenario 'A user cannot register with a missing username' do
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'name', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    expect(page).to have_content("Username must not be blank")
  end
  scenario 'A user cannot register with a missing email' do
    visit '/users/new'
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    expect(page).to have_content("Email must not be blank")
  end
  scenario 'A user cannot register with mismatching passwords' do
    visit '/users/new'
    fill_in 'email', with: "testemai@test.com"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "wrong"
    click_on 'Register'
    expect(page).to have_content("Password does not match the confirmation")
  end
  scenario 'A user cannot register with an email already in use' do
    visit '/users/new'
    fill_in 'email', with: "testemai@test.com"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    visit '/users/new'
    fill_in 'email', with: "testemai@test.com"
    fill_in 'username', with: "TestUserName2"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    expect(page).to have_content("Email is already taken")
  end
  scenario 'A user cannot register with a username already in use' do
    visit '/users/new'
    fill_in 'email', with: "testemai@test.com"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    visit '/users/new'
    fill_in 'email', with: "testemai3@test.com"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    expect(page).to have_content("Username is already taken")
  end
  scenario 'A user cannot register with an invalid email' do
    visit '/users/new'
    fill_in 'email', with: "bademail"
    fill_in 'username', with: "TestUserName"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    expect(page).to have_content("invalid format")
  end
end
