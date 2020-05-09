feature 'Posting a peep' do
  scenario 'a user can post a peep' do
    peep = 'This is a test peep!'

    visit '/peeps'

    expect(page).to have_field 'peep'
    expect(page).to have_button 'Peep it'

    fill_in :peep, with: 'This is a test peep!'
    click_button 'Peep it'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content peep
  end

  scenario 'a user can see peeps in reverse chronological order' do
    peep1 = 'This is a test peep!'
    peep2 = 'This is another test peep!'

    visit '/peeps'

    fill_in :peep, with: peep1
    click_button 'Peep it'
    fill_in :peep, with: peep2
    click_button 'Peep it'

    expect(first('.peep')).to have_content peep2
  end

  scenario 'a user can see the date and time of a peep' do
    peep = 'This is a test peep!'

    visit '/peeps'

    fill_in :peep, with: peep
    click_button 'Peep it'

    expect(current_path).to eq '/peeps'
    page.find_by_id('posted_on', visible: true)
  end
end
