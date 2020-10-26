require 'pg'

feature 'peeps displayed in reverse chronological order' do
  scenario 'User is able to see a feed page of peeps with most recent peep at the top' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO peeps (peep, post_time, username, name) VALUES ('I saw twelve chickens in the park earlier', '#{Time.now.strftime("%H:%M:%S")}', 'CharCharSlide', 'Charlie Bromosky');")
    connection.exec("INSERT INTO peeps (peep, post_time, username, name) VALUES('There are 9 million bicycles in Beijing', '#{Time.now.strftime("%H:%M:%S")}', 'SeaYou', 'Shea Lagoga');")
    visit('/chitter_feed')
    expect(page).to have_content('I saw twelve chickens in the park earlier')
    expect(page).to have_content('There are 9 million bicycles in Beijing')
  end
end

feature 'peeps are listed with their username and name' do
  scenario 'user posts to chitter and it displays their username and name on the peep' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO peeps (peep, post_time, username, name) VALUES ('I saw twelve chickens in the park earlier', '#{Time.now.strftime("%H:%M:%S")}', 'CharCharSlide', 'Charlie Bromosky');")
    visit('/chitter_feed')
    expect(page).to have_content('CharCharSlide')
  end
end
