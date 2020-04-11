feature 'View Peeps' do
  scenario 'list of peeps on homepage' do
    # add test data
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('This is so cool');")
    connection.exec("INSERT INTO peeps (content) VALUES ('I am sending a peep');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Isolation #COVID-19');")

    visit '/'
    expect(page).to have_content 'This is so cool'
    expect(page).to have_content 'I am sending a peep'
    expect(page).to have_content 'Isolation #COVID-19'
  end

  scenario 'list of peeps should start with the newest first' do
    # add test data
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('This is so cool');")
    connection.exec("INSERT INTO peeps (content) VALUES ('I am sending a peep');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Isolation #COVID-19');")

    visit '/'
    expect(first('.peep')).to have_content 'Isolation #COVID-19'
    expect(second('.peep')).to have_content 'Isolation #COVID-19'
  end

end
