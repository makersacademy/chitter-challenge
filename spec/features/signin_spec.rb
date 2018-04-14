feature 'On visiting the log in page for chitter' do
  scenario 'The user has options to enter username and password and submit them through a button' do
    visit ('/chitter')
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_button 'Submit'
  end
end
