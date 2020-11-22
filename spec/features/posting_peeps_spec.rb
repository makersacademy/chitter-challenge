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

end
