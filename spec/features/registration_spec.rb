feature 'Register a new user' do
  scenario 'A user creates an account' do
    visit('/')
    fill_in 'name', with: 'Name'
    click_button 'Submit'
    expect(page).to have_content('Welcome')
  end
end
