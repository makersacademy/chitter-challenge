feature 'Sign up confirmation page' do
  scenario 'User signs up and sees confirmation including their email, name and username' do
    visit('/')
    click_button('Sign up!')
    fill_in('author_name', with: "Marianne")
    fill_in('author_handle', with: "marianneoco")
    fill_in('email', with: "test@email.com")
    fill_in('password', with: "test_password")
    click_button('Sign up!')
    expect(page).to have_content("Thank you Marianne!")
    expect(page).to have_content("You can now use Chitter with the username marianneoco")
    expect(page).to have_content("Check test@email.com for a confirmation")
  end

  scenario 'User has option to return to homepage' do
    visit('/')
    click_button('Sign up!')
    fill_in('author_name', with: "Marianne")
    fill_in('author_handle', with: "marianneoco")
    fill_in('email', with: "test@email.com")
    fill_in('password', with: "test_password")
    click_button('Sign up!')
    expect(page).to have_selector(:link_or_button, 'Click here to return to Chitter')
  end
end
