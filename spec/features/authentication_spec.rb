feature "Authentication" do

  scenario "You can sign in" do
    visit('/')
    click_button('Sign in')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content("Welcome George")
  end

  scenario "User sees an error if they get it wrong" do
    visit('/')
    click_button('Sign in')
    fill_in('email', with: 'incorrect@incorrect.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content("Welcome George")
    expect(page).to have_content('Please check your email or password')
  end

end
