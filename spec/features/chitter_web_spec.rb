feature 'Testing Index Page' do
  scenario 'index page returns messages' do
    connection = PG.connect(dbname: 'chitter_challenge_test')
    connection.exec("INSERT INTO messages (nickname, message) VALUES('Bob', 'Makers Academy Welcome Post');")
    connection.exec("INSERT INTO messages (nickname, message) VALUES('Bob', 'Destroy All Software the Terminator is coming');")
    connection.exec("INSERT INTO messages (nickname, message) VALUES('Dave', 'Google is the best search engine in the world');")
    visit('/message/index')
    expect(page).to have_content 'Makers Academy Welcome Post'
    expect(page).to have_content 'Destroy All Software the Terminator is coming'
    expect(page).to have_content 'Google is the best search engine in the world'

  end
end

feature 'Adding a new message' do
  scenario 'A user can add a message to Chitter Challenge' do
    visit('/message/new')
    fill_in('nickname', with: 'Bob')
    fill_in('message', with: 'Tests are the best')
    click_button('Submit')
    expect(page).to have_content 'Tests are the best'
  end
end
