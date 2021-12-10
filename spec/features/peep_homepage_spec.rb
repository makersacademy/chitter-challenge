require 'pg'

feature 'homepage for chitter' do
  scenario 'user can view peeps' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])
    DatabaseConnection.query("INSERT INTO Peeps(time, content) VALUES($1, $2);", ['1999-01-08 04:05:06', 'Oh hey chitter!'])

    visit('/')
    expect(page).to have_content 'Oh hey chitter!'
  end
end
