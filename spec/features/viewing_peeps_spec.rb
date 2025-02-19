require 'pg'

feature 'Viewing peeps(messages)' do
  scenario 'So a user can see the messages posted on Chitter' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO chitter_posts VALUES (1, 'test_title', 'Hello Chitter, this is my first message!');")
    connection.exec("INSERT INTO chitter_posts VALUES (2, 'test_title_2', 'Hello Chitter, this is my second message!');")
    connection.exec("INSERT INTO chitter_posts VALUES (3, 'test_title_3', 'Hello Chitter, this is my third message!');")
    
    # fill_in 'title', with: 'Title 1'
    # fill_in 'peep', with: 'Hello Chitter, this is my first test message!'
    # click_button 'Submit'
    visit('/chitter')
    # expect(page).to have_content('Title 1')
    expect(page).to have_content('Hello Chitter, this is my first message!')
    expect(page).to have_content('Hello Chitter, this is my second message!')
    expect(page).to have_content('Hello Chitter, this is my third message!')
  end
end