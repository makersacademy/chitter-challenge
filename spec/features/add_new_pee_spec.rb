feature 'create new peep' do
  scenario 'a user create a new peep less than or equal to 280 chars' do
    visit ('/peeps/new')

    fill_in('text', with: 'test peep')
    fill_in('username', with: 'user1')
    click_button('Peep')

    expect(page).to have_content 'test peep'
  end

  scenario 'A user create a new peep over 280 chars' do
    long_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate."

    visit('/peeps/new')
    fill_in('text', with: long_text)
    fill_in('username', with: 'user2')
    click_button('Peep')

    expect(page).not_to have_content long_text
    #expect(page).to have_content "You must enter a valid URL"
  end
end
