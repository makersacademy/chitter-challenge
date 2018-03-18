feature "User can sign up" do

  scenario "User clicks sign up and sees sign up page" do
    visit('/')
    click_button('Sign up')
    expect(page).to have_content('Sign up')
  end

  scenario "User inputs their details and they are saved" do
    visit('/')
    click_button('Sign up')
    fill_in('username', with: 'Francesca')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'password')
    click_button('Submit')
    expect(page).to have_content("Welcome Francesca")
  end

end
