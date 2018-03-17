feature 'Add a blah' do
  scenario 'A user can see a button to add a blah' do
    visit('/')

    expect(page).to have_selector(:button, 'New blah')
  end

  scenario 'A user is redirected to a page to enter a blah' do
    visit('/')
    click_button('New blah')

    expect(page).to have_content('Please enter a new blah')
  end

  scenario 'The users blah is added to the list of blahs on submission' do
    visit('/')
    click_button('New blah')

    fill_in('blah', with: 'A new feature test blah')
    click_button('Add blah')

    expect(page).to have_content('A new feature test blah')
  end
end
