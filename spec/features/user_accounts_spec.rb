
feature 'user accounts' do

  scenario 'user can register a new account' do
    visit('/chitter')
    expect(page).to have_xpath('//div[@id="welcome-message"]')
    expect(page).to have_xpath('//button[@name="user-registration"]')
    click_button("Sign Up")
    fill_in("Username:",with: 'simym')
    fill_in("Display Name:",with: 'ContraP')
    fill_in("Password:",with: 'password!')
    click_button("Register")
    expect(page).to have_content("Hello there, ContraP")
  end

  scenario 'user can login to an account' do
    visit('/chitter')
    click_button("Login")
    fill_in("Username:",with: "admin")
    fill_in("Password:",with: "admin")
    click_button("Login")
    expect(page).to have_content("Hello there, admin")
  end

end
