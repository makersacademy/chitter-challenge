feature "user can sign in" do

  before do
    test_database_setup

    visit '/chitter'
    fill_in 'name', with: 'Sipho Adebayo'
    fill_in 'user-handle', with: 'Sips'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button 'Sign up'
  end

  scenario "signs in if email and password are correct/exist" do

    visit '/chitter/sign-in'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Sign in"

    expect(page).to have_content "Account: Sips"
  end

  scenario "sign in fails if email is not correct" do
    visit '/chitter/sign-in'
    fill_in 'email', with: 'sipho@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Sign in"

    expect(page).to have_content "Email or password are incorrect. Please try again."
  end

  scenario "sign in fails if password is not correct" do
    visit '/chitter/sign-in'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'da508967'
    click_button "Sign in"
    
    expect(page).to have_content "Email or password are incorrect. Please try again."
  end
end
