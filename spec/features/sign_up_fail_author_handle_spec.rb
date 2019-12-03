feature 'Sign up fails because handle already taken' do
  scenario 'User tries to sign up but sees error message' do
    connection = PG.connect( dbname: 'Chitter_test' )
    connection.exec "INSERT INTO users VALUES(1, 'Bob', 'marianneoco', 'some@email.com', 'makers');"
    visit('/')
    click_button('Sign up!')
    fill_in('author_name', with: "Marianne")
    fill_in('author_handle', with: "marianneoco")
    fill_in('email', with: "test@email.com")
    fill_in('password', with: "test_password")
    click_button('Sign up!')
    expect(page).to have_content("This handle has already been taken! Please choose another.")
    expect(page).to have_selector(:link_or_button, 'Try again')
  end
end
