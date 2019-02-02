
feature 'Sign-up' do
  before(:each) do
    database_wiper
  end
  scenario 'User can register an account with ChipChune' do
    visit('/')
    click_on('sign-up')
    fill_in 'username', with: 'kawaiichan@netscape.com'
    fill_in 'username', with: 'testyboy'
    fill_in 'password', with: 'password123'
    click_on('register')
    expect(page).to have_content('signed in as testyboy')
  end
end
