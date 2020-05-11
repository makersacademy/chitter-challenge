feature 'sign up' do
  scenario 'user can sign up' do
    visit('/peeps')
    click_button("Sign up!")
    fill_in('name', with: 'Ellis')
    fill_in('username', with: "ellischitter")
    fill_in('email', with: "ellis@ellis.com")
    fill_in('password', with: "ellis123")
    click_button("Submit")

    expect(page).to have_content("You have successfully signed up for chitter!")
    expect(page).to have_content("Name: Ellis")
    expect(page).to have_content("Username: ellischitter")
    expect(page).to have_content("Email: ellis@ellis.com")
    expect(page).to have_content("Password: ellis123")
  end
end
