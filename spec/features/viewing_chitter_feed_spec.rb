require 'pg'

feature 'viewing Chitter feed'do
  scenario 'A user can view peeps on the chitter feed' do 
    connection = PG.connect(dbname: 'chitter')

    connection.exec("INSERT INTO chitter_feed VALUES(1, 'This is my first peep on Chitter!');")
    connection.exec("INSERT INTO chitter_feed VALUES(2, 'I love Chitter');")
    connection.exec("INSERT INTO chitter_feed VALUES(3, 'I spend most of my time coding');")


    visit('/chitter_feed')

    expect(page).to have_content 'This is my first peep on Chitter!'
    expect(page).to have_content 'I love Chitter'
    expect(page).to have_content 'I spend most of my time coding'
  end
end

