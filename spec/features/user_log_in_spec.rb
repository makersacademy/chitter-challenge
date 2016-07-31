
feature 'log in' do
  scenario 'user can log in' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'password_confirmation', with: "password123"
    fill_in 'name', with: "Samed Yalniz"
    fill_in 'username', with: "syalniz"
    click_button "Sign up"
    visit '/sessions'
    fill_in "username", with: "syalniz"
    fill_in "password", with: "password123"
    click_button "Sign in"
    expect(page).to have_content ("Welcome #{User.first.name}")
  end

  scenario 'user cannot login with a wrong password' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'password_confirmation', with: "password123"
    fill_in 'name', with: "Samed Yalniz"
    fill_in 'username', with: "syalniz"
    click_button "Sign up"
    visit'/sessions'
    fill_in "username", with: "syalniz"
    fill_in "password", with: "password122"
    click_button "Sign in"
      expect(current_path).to eq '/sessions'
  end
  scenario 'user can sign out' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'password_confirmation', with: "password123"
    fill_in 'name', with: "Samed Yalniz"
    fill_in 'username', with: "syalniz"
    click_button "Sign up"
    visit'/sessions'
    fill_in "username", with: "syalniz"
    fill_in "password", with: "password123"
    click_button "Sign in"
    require 'pry'; binding.pry
    click_button "Log out"

    expect(page).not_to have_content("Welcome")
  end
end
