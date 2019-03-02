# note: chitter_test database is reset before every test - see spec_helper
feature 'Display peeps:' do
  scenario 'show all peeps in reverse chronological order' do
    visit '/peeps'
    expect(page.body.index('The second ever peep')).to be < page.body.index('The first ever peep')
  end
  scenario 'shows the time of each peep' do
    visit '/peeps'
    expect(page).to have_content("12:10")
  end
end
