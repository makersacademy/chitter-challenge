feature "registration" do
  scenario "a user can sign up" do
    visit('/users/new')
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Create User!')
    expect(page).to have_content("test@test.com")
  end
end