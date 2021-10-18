feature 'registration' do
  before(:each) do
    DatabaseConnection.query("TRUNCATE users")
  end
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('username', with: 'testerguy')
    fill_in('name', with: 'Test Guy')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, testerguy"
  end
end