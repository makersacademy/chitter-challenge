feature "user can log in" do

  before do
    test_database_setup
    sign_up_new_user
  end

  scenario "signs in if email and password are correct/exist" do

    visit '/log-in'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Log In"

    expect(page).to have_content "Account: Sips"
  end

  scenario "sign in fails if email is not correct" do
    visit '/log-in'
    fill_in 'email', with: 'sipho@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Log In"

    expect(page).to have_content "Email or password are incorrect. Please try again."
  end

  scenario "sign in fails if password is not correct" do
    visit '/log-in'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'da508967'
    click_button "Log In"

    expect(page).to have_content "Email or password are incorrect. Please try again."
  end
end
