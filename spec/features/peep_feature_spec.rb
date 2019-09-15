# require 'pg'
feature 'Add a peep' do
  scenario 'user can add a peep' do
    drop_test_database
    # populate_test_database
    visit '/'
    click_button 'compose_peep'
    fill_in :peep_text, with: 'This is chitter'
    click_button 'Submit'
    con = PG.connect dbname: 'chitter_test'
    result = con.exec "SELECT * FROM peeps where id = '1'"
    expect(result.values[0][1]).to eq('This is chitter')
  end
end

feature 'See all peeps ' do
  scenario 'the user can see all peeps' do
    drop_test_database
    populate_test_database
    visit '/peeps'
    expect(page).to have_content('This is chitter')
  end

  scenario 'the user sees peeps in reverse chronological order' do
    drop_test_database
    populate_test_database
    visit '/peeps'
    expect(page.find('li:nth-child(1)')).to have_content 'This peep should appear first'
  end

  scenario 'the user can see the time on each peep' do
    drop_test_database
    t = Time.now
    populate_test_database
    visit '/peeps'
    expect(page.find('li:nth-child(1)')).to have_content(t.strftime('%H:%M'))
  end

  # t = Time.now
  # t.strftime('%H')
  #   #=> returns a 0-padded string of the hour, like "07"
  # t.strftime('%M')
  #   #=> returns a 0-padded string of the minute, like "03"
  # t.strftime('%H:%M')
  #   #=> "07:03"

end

# RSPEC TO COMPARE TIME TO USE LATER
# expect(@article.updated_at.utc).to be_within(1.second).of Time.now
