feature 'Chitter' do

  scenario 'seeing a home page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end

  scenario 'seeing messages on home page' do
    connection = PG.connect(dbname: 'chitterdb_test')

    connection.exec("INSERT INTO messages (message_text, author_handle, user_name) VALUES ('Where''s my head?', '@winter_coming', 'Ned Stark');")
    visit '/'
    expect(page).to have_content "Where's my head?"
    expect(page).to have_content "winter_coming"
    expect(page).to have_content "Ned Stark"
  end

  scenario 'logging in as another user and posting messages' do
    connection = PG.connect(dbname: 'chitterdb_test')

    connection.exec("INSERT INTO users (user_handle, user_name, user_email, user_password) VALUES ('@KingSlayer', 'Jamie Lannister', 'Jamie@KingSlayer.com', '@KingSlayer');")
    visit '/'
    click_button "Log in / Sign up"
    fill_in "user_handle", with: "@KingSlayer"
    fill_in "user_password", with: "@KingSlayer"
    click_button "Log in"
    fill_in "message", with: "Your head scrubbed up rather nicely Ned!"
    click_button "Send"
    expect(page).to have_content "Your head scrubbed up rather nicely Ned!"
    expect(page).to have_content "@KingSlayer"
    expect(page).to have_content "Jamie Lannister"
    expect(page).to have_content "Log out"
    expect(page).to have_content "Send message"
  end

  scenario 'logging a user out' do
    connection = PG.connect(dbname: 'chitterdb_test')

    connection.exec("INSERT INTO users (user_handle, user_name, user_email, user_password) VALUES ('@KingSlayer', 'Jamie Lannister', 'Jamie@KingSlayer.com', '@KingSlayer');")
    visit '/'
    click_button "Log in / Sign up"
    fill_in "user_handle", with: "@KingSlayer"
    fill_in "user_password", with: "@KingSlayer"
    click_button "Log in"
    click_button "Log out"
    expect(page).to have_content "Sign up"
    expect(page).not_to have_content "Log out"
    expect(page).not_to have_content "Send message"
  end

end
