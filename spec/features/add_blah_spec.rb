feature 'Add a blah' do
  scenario 'A registered user can see a button to add a blah' do
    sign_up
    expect(page).to have_selector(:button, 'Add blah')
  end

  scenario 'A registered user is able to add a blah' do
    sign_up('@Test')

    fill_in('blah', with: 'A new feature test blah')
    click_button('Add blah')

    expect(page).to have_content('A new feature test blah')
    expect(page.first(:css, '.tile-content')).to have_content('A new feature test blah')
    expect(page.first(:css, '.tile-content')).to have_content('@Test')
  end

end
