feature 'View peeps' do
  scenario 'View all peeps in reverse chronological order' do
    create_new_peep('First peep')
    create_new_peep('Second peep')
    visit '/peeps'
    expect(page).to have_content('First peep')
    expect(page).to have_content('Second peep')
  end

  scenario 'Peeps should have a create time' do
    create_new_peep('First peep')
    visit '/peeps'
    expect(page).to have_content('Created at')
  end
end
