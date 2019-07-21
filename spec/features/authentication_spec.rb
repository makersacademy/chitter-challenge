feature "Authentication" do
  scenario "User logs in" do
    User.create(email: "testing1234@test.com", password: "12345")

    visit('/sessions/new')
    fill_in 'email', with: 'testing1234@test.com'
    fill_in 'password', with: '12345'

    expect(page).to have_content('Welcome testing1234@test.com')
  end
end
