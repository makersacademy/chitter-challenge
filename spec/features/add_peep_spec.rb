feature 'create new peep' do
  scenario 'a user creates a new peep less than or equal to 280 chars' do
    visit '/'
    fill_in('username', with: 'stro2275')
    fill_in('password', with: 'password123')
    click_button('Submit')

    click_button('New Peep!')
    fill_in('text', with: 'test peep')
    click_button('Peep')

    expect(page).to have_content 'test peep'
    expect(page).to have_content 'stro2275'
  end

  scenario 'a user cannot create a new peep over 280 chars' do
    long_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate."

    visit '/'
    fill_in('username', with: 'stro2275')
    fill_in('password', with: 'password123')
    click_button('Submit')

    click_button('New Peep!')
    fill_in('text', with: long_text)
    click_button('Peep')

    expect(page).not_to have_content long_text
    expect(page).to have_content "Your peep must be 280 characters or less"
  end
end
