feature 'Visting the homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'My first peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Hello');")

    visit('/peeps')
    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'Hello'
  end
end
