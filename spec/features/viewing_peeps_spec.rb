feature 'Viewing peeps' do
  scenario 'User can see a peep' do
    add_peep("Test peep")
    visit '/peeps'
    expect(page).to have_content "Test peep"
  end

  scenario 'User can see all peeps in reverse chronological order' do
    add_peep("Oldest peep")
    add_peep("Extra peep")
    add_peep("Most recent peep")

    visit '/peeps'

    expect(find("ul li:first-child")).to have_content "Most recent peep"
    expect(find("ul li:last-child")).to have_content "Oldest peep"
  end

  scenario 'User can see the time at which a peep was made' do
    add_peep("This peep has a timestamp")
    visit '/peeps'
    # this is a bad test
    expect(page).to have_content 'Created at:'
  end
end
