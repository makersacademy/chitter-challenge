feature 'Posting peeps' do
  scenario 'Have a link to post a peep' do
    visit('/')
    expect(page).to have_link('Peep it!')
  end

  scenario 'Being able to submit a peep' do
    visit('/')
    click_link('Peep it!')
    expect(page).to have_field('peep')
    expect(page).to have_button('Post')
  end

  scenario 'Adding a peep to Chitter' do
    visit('/post_peep')
    fill_in('peep', with: 'This is a test peep!')
    click_button('Post')
    expect(page).to have_link('Peep it!')
  end

  scenario 'Should be anonymous if the user is not registered' do
    visit('/')
    click_link('Peep it!')
    expect(page).to have_field('name', with: 'anonymous')
    expect(page).to have_field('username', with: 'anonymous')
  end

  scenario 'Should have name and username if user is registered' do
    visit('/')
    click_link('Please, register!')
    fill_in('name', with: 'name')
    fill_in('username', with: 'username')
    click_button('Submit')
    click_link('Peep it!')
    expect(page).to have_field('name', with: 'name')
    expect(page).to have_field('username', with: 'username')
  end

end
