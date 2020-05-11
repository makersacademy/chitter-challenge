feature 'sign in' do
  scenario 'user can sign in' do
    visit('/peeps')
    click_button("Sign up!")
    fill_in('name', with: 'Ellis')
    fill_in('username', with: "ellischitter")
    fill_in('email', with: "ellis@ellis.com")
    fill_in('password', with: "ellis123")
    click_button("Submit")

    click_button("Log in!")

    fill_in('username', with: "ellischitter")
    fill_in('password', with: "ellis123")

    expect(page).to have_content("What's on your mind?")
  end
end
