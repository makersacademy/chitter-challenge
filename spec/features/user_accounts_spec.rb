
feature 'user accounts' do

  scenario 'user can register a new account' do
    visit('/chitter')
    expect(page).to have_content('Welcome to Chitter')
    click_button("Sign Up")
    fill_in("Username:", with: 'simym')
    fill_in("Display Name:", with: 'ContraP')
    fill_in("Email Address:", with: 'ContraP@youtube.com')
    fill_in("Password:", with: 'password!')
    click_button("Register")
    expect(page).to have_content("Hello there, ContraP")
    expect(page).to have_button("Logout")
  end

  scenario 'user can login to an account' do
    visit('/chitter')
    click_button("Login")
    fill_in("Username:", with: "admin")
    fill_in("Password:", with: "admin")
    click_button("Login")
    expect(page).to have_content("Hello there, admin")
    expect(page).to have_button("Logout")
    click_button("Logout")
  end

end
