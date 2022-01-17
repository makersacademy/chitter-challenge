feature 'Users registration' do
  scenario 'Users can fill in a registration form' do
    visit '/users/new'
    fill_in('email', with: 'nicole@kidman.com')
    fill_in('username', with: 'nicole')
    fill_in('name', with: 'Nicole Kidman')
    fill_in('password', with: 'emptycinema')
    click_on('Submit')

    expect(page).to have_content 'Welcome, Nicole Kidman!'
  end
end
