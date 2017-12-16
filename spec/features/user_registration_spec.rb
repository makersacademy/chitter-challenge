feature 'User registration' do
  scenario 'A user can register with valid data and is welcomed' do
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'Register'
    expect(page).to have_content("Welcome: testemail@testserver.com")
  end
end
