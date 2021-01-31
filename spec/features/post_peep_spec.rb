feature 'add peep' do
  # scenario 'boxes are labelled' do
  #   visit '/bookmarks/new'
  #   expect(page).to have_content("Site")
  #   expect(page).to have_content("URL")
  # end
  scenario 'input box and peep button' do
    visit('/')
    expect(page).to have_content('What would you like to peep?')
    expect(page).to have_field("peep")
  end

  scenario 'user can add a peep to the feed' do
    visit('/')
    fill_in :peep, with: 'Hi! First peep :)'
    click_button('Peep!')
    expect(page).to have_content('Hi! First peep :)')
  end

  scenario 'user can retrieve all tweets from database' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep) VALUES('First peep');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Second peep');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Third peep');")

    visit('/feed')

    expect(page).to have_content 'First peep'
    expect(page).to have_content 'Second peep'
    expect(page).to have_content 'Third peep'
  end

end
