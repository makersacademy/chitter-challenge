feature 'viewing peeps' do
  scenario 'a user can view their peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("INSERT INTO peeps (name, username, content, time) VALUES ('Jason Wong', 'jasylw', 'Hello!', '2020-02-15 11:13:01');")
    connection.exec("INSERT INTO peeps (name, username, content, time) VALUES ('Jason Wong', 'jasylw', 'Hello again!', '2020-02-15 11:46:25');")
    
    visit('/peeps')
    expect(page).to have_content("Hello!")
    expect(page).to have_content("Hello again!")
  end
end
