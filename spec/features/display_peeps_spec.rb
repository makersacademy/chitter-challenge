feature 'Display peeps:' do
  scenario 'show all peeps in reverse chronological order ' do
    # note: database is reloaded before every test - see spec_helper
    visit '/peeps'
    expect(page).to have_content('The first ever peep')
  end
end
