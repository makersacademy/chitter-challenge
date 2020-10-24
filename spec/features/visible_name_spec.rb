feature 'visible names' do
  scenario 'each post displays the name of the user who posted it' do
    allow_any_instance_of(Peep).to receive(:peeptime).and_return('Test string')
    visit '/'
    click_on('Sign up')
    fill_in('name', with: 'Barry')
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    fill_in('newpeep', with: "")
    fill_in('newpeep', with: "This peep is for test purposes. Please do not take it seriously.")
    click_on('Submit')
    expect(page).to have_content "Welcome, test@testing.com\nThis peep is for test purposes. Please do not take it seriously. Posted by: Barry Peeptime: Test string\nWrite something in here..."

  end
end
