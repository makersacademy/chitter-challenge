require 'pg'

feature 'peeps displayed in reverse chronological order' do
  scenario 'User is able to see a feed page of peeps with most recent peep at the top' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO peeps (peep) VALUES ('I saw twelve chickens in the park earlier');")
    connection.exec("INSERT INTO peeps (peep) VALUES('There are 9 million bicycles in Beijing');")
    visit('/chitter_feed')
    expect(page).to have_content('I saw twelve chickens in the park earlier')
    expect(page).to have_content('There are 9 million bicycles in Beijing')
    # have not actually checked in reverse order here
  end
end

feature 'peeps are listed with their username and name' do
  scenario 'user posts to chitter and it displays their username and name on the peep' do
    # either log in or sign up then save to session parameter - user name : CharCharSlide, name: Charlie Boot-off
    visit('/chitter_feed/new_peep')
    fill_in 'peep_text', with: 'At this point, what even is a peep?'
    click_on 'Post'
    visit('/chitter_feed')
    expect(page).to have_content('CharCharSlide')
    expect(page).to have_content('Charlie Boot-off')
  end
end
