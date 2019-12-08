feature 'Viewing homepage' do
  connection = PG.connect(dbname: 'chitter_test')

  scenario 'Check the root route links to the homepage and shows a list of peeps' do
    connection.exec("INSERT INTO peeps (userid, content) VALUES('EllieM', 'Test peep')")
    visit('/')
    expect(page).to have_content 'Test peep'
  end

  scenario 'Check the root route links to the homepage and shows a list of peeps' do
    visit('/')
    expect(page).to have_button 'Sign Up'
  end

  scenario 'Check the root route links to the homepage and shows a list of peeps' do
    visit('/')
    expect(page).to have_button 'New peep'
  end
end
