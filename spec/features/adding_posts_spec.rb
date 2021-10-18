feature "adding posts" do
  before(:each) do
    DatabaseConnection.query("TRUNCATE users")
    DatabaseConnection.query("TRUNCATE messages")
  end

  scenario "posting a new message" do
    visit '/users/new'
    fill_in('username', with: 'testerguy')
    fill_in('name', with: 'Test Guy')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    fill_in 'message', with: 'I am having a really great day today!'
    click_button("Send")
    expect(page).to have_content('I am having a really great day today!')
  end
end