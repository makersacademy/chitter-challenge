feature "The user can sign in" do

  scenario "You can sign in" do
    visit('/')
    click_button('Sign in')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content("Welcome George")
  end

end
