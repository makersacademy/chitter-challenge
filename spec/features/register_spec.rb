feature 'Registration page' do
  scenario 'allows user to register' do
    visit('/')
    click_button('Register')
    expect(page).to have_content("Please enter your details.")
    expect(page).to have_field("name")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end
end
