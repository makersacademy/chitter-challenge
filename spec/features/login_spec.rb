feature 'Signing in' do
  before(:each) do
    database_wiper
    visit('/')
  end
  scenario 'Can sign in' do
    expect(page).to_not have_content("signed in as testyboy")
    fill_in 'username', with:'testyboy'
    fill_in 'password', with:'password123'
    click_on('sign in')
    expect(page).to have_content("signed in as testyboy")
  end
end
