
feature 'registering new user' do
  scenario 'new user being added' do
    visit('/users/new')
    fill_in("email", with:"email@gmail.com")
    fill_in("password", with:"password")
    click_button ('submit')
    expect(page).to have_content('Welcome, email@gmail.com')

  end
end
