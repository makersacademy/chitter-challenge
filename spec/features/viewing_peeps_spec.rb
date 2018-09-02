feature 'Viewing peeps' do
  # as a social media user
  # so i can see the chitter feed
  # i want to be able to view the chitter peeps in reverse chronological order
  scenario 'A user can see the peeps' do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (text) VALUES ('the sky is blue');")
    connection.exec("INSERT INTO peeps (text) VALUES ('the sea is green');")
    connection.exec("INSERT INTO peeps (text) VALUES ('fire is red');")

    visit('/peeps')

    expect(page).to have_content("the sky is blue")
    expect(page).to have_content("the sea is green")
    expect(page).to have_content("fire is red")
  end
end
