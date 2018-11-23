feature 'Peeps' do
  scenario 'A user can view a peep' do
    visit('/')
    expect(page).to have_content "Hello, this is my first peep"
  end

  scenario 'Adding a peep' do
    visit('/chitter')
    fill_in('content', with: 'This is my second peep')
    click_button('Add peep')
    expect(page).to have_content "This is my second peep"
  end

  scenario 'Adding a user to Chitter' do
    visit('/chitter/users')
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'testpassword')
    click_button('Submit')
    expect(page).to have_content "You have signed up!"
  end
end
