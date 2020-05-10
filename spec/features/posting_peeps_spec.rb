feature 'Posting a peep' do
  scenario 'a user can post a peep' do
    make_a_peep

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is a test peep!'
  end

  scenario 'a user can see peeps in reverse chronological order' do
    peep = 'This is another test peep!'

    make_a_peep
    fill_in :peep, with: peep
    click_button 'Peep it'

    expect(first('.peep')).to have_content peep
  end

  scenario 'a user can see the date and time of a peep' do
    make_a_peep

    expect(current_path).to eq '/peeps'
    page.find_by_id('posted_on', visible: true)
  end
end
