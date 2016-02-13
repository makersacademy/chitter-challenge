feature 'signup' do
  scenario 'a user navigates from the home page and fills in personal details' do
    visit '/'
    click_link('Create account')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'password')
    fill_in('Name', with: 'Matthew Bridges')
    fill_in('Username', with: 'Indigo')
    click_button 'Submit'
    expect(page).to have_content('Logged in as: Indigo')
  end
end
