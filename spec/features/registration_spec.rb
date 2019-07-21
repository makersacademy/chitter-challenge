feature "Registration" do
  scenario "A user can sign up" do
    visit('/user/new')
    fill_in 'email', with: 'test123@testing.com'
    fill_in 'password', with: 'test1234'
    click_button('Submit')
    expect(page).to have_content('Welcome, test123@testing.com!')
  end
end
