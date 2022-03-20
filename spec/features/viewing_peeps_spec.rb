feature 'Viewing peeps' do
  scenario 'user can see all peeps' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('Hello World');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Sunny today');")

    visit('/')
    
    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Sunny today'
  end
end

