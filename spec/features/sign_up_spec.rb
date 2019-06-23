feature 'sign up to Chitter' do
  scenario 'user signs up to Chitter' do
    visit('/chitter/sign_up')

    expect(page).to have_content("Sign up to Chitter")

    fill_in("first_name", with: "Joe")
    fill_in("last_name", with: "Bloggs")
    fill_in("username", with: "jbloggs")
    fill_in("email", with: "joe.bloggs@testemail.com")
    fill_in("password", with: "IAmJoeBloggs")
    fill_in("confirm_password", with: "IAmJoeBloggs")
    click_button("Submit")

    expect(page).to have_content("Joe")
  end
end
