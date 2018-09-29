feature 'Posting a new peep' do

  scenario 'A user can click button to be taken to posting a peep page' do
    visit '/peeps'
    click_on('New Peep')

    expect(page).to have_content 'What\'s Happening?'
  end

  scenario 'A user can post a new peep to Chitter' do
    visit '/peeps/new'
    fill_in('peep', with: 'This is a new peep')
    click_on('Post')

    expect(page).to have_content 'This is a new peep'
  end
end
