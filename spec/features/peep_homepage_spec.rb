require 'pg'

feature 'homepage for chitter' do
  scenario 'user can view peeps' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])
    user_id = DatabaseConnection.query("SELECT id FROM Users WHERE email = 'example@gmail.com';")
    DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3);", [user_id[0]["id"].to_i, '1999-01-08 04:05:06', 'Oh hey chitter!'])

    visit('/')
    
    expect(page).to have_content 'Oh hey chitter!'
  end
end
