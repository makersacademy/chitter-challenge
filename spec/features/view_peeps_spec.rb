require 'pg'

feature 'View Peeps' do
  scenario 'user can see what others are saying' do # in reverse chronological order'
    # connect to test database
    connection = PG.connect(dbname: 'chitter_test')

    # load in database info
    #  # chit_user table
    # load in database info
    # chit_user table
    # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('test@test.com', 'test', 'Ginny', 'ginnyamazed');")
    # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('1test@test.com', 'test', 'Jon', 'JonAZ');")
    # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('2test@test.com', 'test', 'Grace', 'doglover');")
    # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('3test@test.com', 'test', 'Jay', 'amorthian');")
    # peeps table
    connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (1, 'this is a test, should be Ginny as user', '2021-08-09 22:07:10');")
    connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (1, 'this is another test message, Ginny as user', '2021-08-09 21:50:40');")
    connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (4, 'test message, Jon as user', '2021-10-10 03:57:40');")
    connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (3, 'Grace as user', '2021-08-09 13:57:40');")

    visit '/'
    click_button 'Go to Peeps!'

    expect(page).to have_content 'Here are the latest Peeps!'
    expect(page).to have_content 'Peeps are viewable with the newest at the top:'
    expect(page).to have_content 'this is a test, should be Ginny as user'
    expect(page).to have_content 'this is another test message, Ginny as user'
    expect(page).to have_content 'test message, Jon as user'
    expect(page).to have_content 'Grace as user'
  end
end
