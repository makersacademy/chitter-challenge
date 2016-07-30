
feature 'log in' do
  scenario 'user can log in' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'password_confirmation', with: "password123"
    fill_in 'name', with: "Samed Yalniz"
    fill_in 'username', with: "syalniz"
    click_button "Sign up"
    visit '/users'
    within ('div#login.login') do
      click_button "Log in"
    end
    fill_in "username", with: "syalniz"
    fill_in "password", with: "password123"
    click_button "Log in"
    expect(page).to have_content ("Welcome #{User.first.name}")
  end

end
