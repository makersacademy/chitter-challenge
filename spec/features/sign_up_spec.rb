feature 'signup' do
  scenario 'a user can sign up' do
    visit '/signup'
    fill_in('email', with: 'test@email.com')
    fill_in('username', with: 'testusername')
    fill_in('name', with: 'Test Name')
    fill_in('password', with: 'Test Password')
    click_button('Submit')

    expect(page).to have_content "Welcome, test@email.com"
  end
end
