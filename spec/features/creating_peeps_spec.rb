feature 'Adding a peep' do
  scenario 'A user can add a peep to Chitter when logged in' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

    visit '/sessions/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button('Sign in')

    visit('/peeps/new')
    fill_in('message', with: 'Hello chickens!')
    click_button('Submit')

    expect(page).to have_content("Hello chickens!")
  end

  scenario 'A user cannot add a peep when not logged in' do
    visit('/peeps/new')

    expect(page).not_to have_button('Submit')
    expect(page).to have_content("You must be logged in to peep.")
  end

  scenario 'a user can access posting peeps from the peeps page' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

    visit '/sessions/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button('Sign in')
    
    visit '/peeps'
    click_button('New Peep')
    
    expect(page).to have_content 'Make a new peep'
  end
end
