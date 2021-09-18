feature 'Visiting the home page' do
  scenario 'a user can see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO users (name, username, email, password) VALUES ('Ronaldo', 'fenomeno', 'r9@gmail.com', 'fenomeno9');")
    connection.exec("INSERT INTO users (name, username, email, password) VALUES ('Ronaldinho', 'gaucho', 'r10@gmail.com', 'dinho10@gmail.com');")

    connection.exec("INSERT INTO peeps (user_id, body) VALUES(1, 'The real Ronaldo is the first user of this amazing app');")
    connection.exec("INSERT INTO peeps (user_id, body) VALUES(2, 'Hey Ronnie, wanna go dribble half of France together?');")
    connection.exec("INSERT INTO peeps (user_id, body) VALUES(1, 'Yeah, why not');")
    
    visit '/'

    expect(page).to have_content 'The real Ronaldo is the first user of this amazing app'
    expect(page).to have_content 'Hey Ronnie, wanna go dribble half of France together?'
    expect(page).to have_content 'Yeah, why not'
  end
end
