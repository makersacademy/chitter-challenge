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

end
