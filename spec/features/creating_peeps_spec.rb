feature 'Adding a peep' do
  scenario 'A user can add a peep to Chitter when logged in' do
    log_in_with_test_user_1

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
    log_in_with_test_user_1
    
    visit '/peeps'
    click_button('New Peep')
    
    expect(page).to have_content 'Make a new peep'
    expect(current_path).to eq '/peeps/new'
  end
end
