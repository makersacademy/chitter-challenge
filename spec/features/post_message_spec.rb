# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'I want to post message to chitter' do
  scenario 'I want to post Hello Everyone on chitter' do
    visit('/peeps/new')
    # expect(page).to have_selector("input[value='Post Title']")
    fill_in('message', with: "Test Peep")
    click_button('submit')
    expect(current_path).to eq '/peeps/index'
    expect(page.status_code).to eq 200
    # within 'ul#peeps' do
    expect(page).to have_content('Test Peep')
    end
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order

feature 'I want to see messages to chitter' do
  scenario 'I want to list my messages on chitter' do
    setup_test_database
    conn = PG.connect(dbname: 'peeps_test')
    conn.exec ("INSERT INTO peeps (messages) VALUES ('Testing messages');")
    conn.exec ("INSERT INTO peeps (messages) VALUES ('Is working');")
    conn.exec ("INSERT INTO peeps (messages) VALUES ('As expected');")
    visit('/peeps/index')
    expect(page).to have_content("Testing messages")
    #expect(page).to have_content(instance_of_Time)
    expect(page).to have_content("Is working")
    expect(page).to have_content("As expected")
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'User can see the time message was posted' do
  scenario 'Update about time was posted at 11:45' do
    setup_test_database
    conn = PG.connect(dbname: 'peeps_test')
    conn.exec ("INSERT INTO peeps (messages) VALUES ('Update about time');")
    result = conn.exec ("SELECT time_of_creation FROM peeps WHERE (messages = 'Update about time');")
    visit('/peeps/index')
    expect(page).to have_content("Update about time")
    expect(page).to have_content(result[0]['time_of_creation'])
  end
end
