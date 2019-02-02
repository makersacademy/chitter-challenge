feature 'Log out' do
  before(:each) do
    database_wiper
    autoregister
    visit('/')
  end

  scenario 'log out' do
    expect(page).to_not have_button('sign in')
    expect(page).to have_content('signed in as testyboy')
    click_on('sign out')
    expect(page).to_not have_content('signed in as testyboy')
    expect(page).to have_button('sign in')
  end
end
  #cant log out if not logged in
