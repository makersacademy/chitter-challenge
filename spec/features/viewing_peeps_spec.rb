feature 'Viewing peeps' do
  scenario 'redirecting from the index page to the peeps page' do
    visit('/')
    expect(current_path).to eq '/peeps'
  end

  # User Story 2:
  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order

  scenario 'see a list of peeps on homepage' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (text) VALUES ('Feeling those summer vibes today');")
    connection.exec("INSERT INTO peeps (text) VALUES ('Got the frisbee out for the first time in months!');")
    connection.exec("INSERT INTO peeps (text) VALUES ('Damn, it''s suncream o''clock!');")

    visit('/peeps')

    expect(page).to have_content "Feeling those summer vibes today"
    expect(page).to have_content "Got the frisbee out for the first time in months!"
    expect(page).to have_content "Damn, it's suncream o'clock!"
  end

  # See the tweets in reverse chronological order

end
