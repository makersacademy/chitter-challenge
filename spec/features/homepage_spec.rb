feature 'Viewing homepage' do
  scenario 'Check the root route links to the homepage and shows a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (userid, content) VALUES('EllieM', 'Test peep')")
    visit('/')
    expect(page).to have_content 'Test peep'
  end
end
