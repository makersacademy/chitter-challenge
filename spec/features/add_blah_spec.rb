feature 'Add a blah' do
  scenario 'A registered user can see a button to add a blah' do
    sign_up

    expect(page).to have_selector(:button, 'New blah')
  end

  scenario 'A registered user is redirected to a page to enter a blah' do
    sign_up
    click_button('New blah')

    expect(page).to have_content('Please enter a new blah')
  end

  scenario 'The users blah and username is added to the list of blahs on submission' do
    sign_up('@Test')
    click_button('New blah')

    fill_in('blah', with: 'A new feature test blah')
    click_button('Add blah')

    expect(page).to have_content('A new feature test blah')
    expect(page.find('li', text: 'A new feature test blah')).to have_content('@Test')
  end
end
