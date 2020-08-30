feature 'View cheeps' do 
  scenario 'A user can view cheeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO chitter VALUES(1, 'Hello Chitter!');")
    connection.exec("INSERT INTO chitter VALUES(2, 'What shall I eat for dinner?');")
    connection.exec("INSERT INTO chitter VALUES(3, ':)');")

    visit('/')
  
    expect(page).to have_content 'Hello Chitter!'
    expect(page).to have_content 'What shall I eat for dinner?'
    expect(page).to have_content ':)'
  end
end