# frozen_string_literal: true

feature 'Viewing tweets' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_selector(:link_or_button, 'View Peeps')
  end

  scenario 'Viewing all tweets' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO tweets VALUES(1, 'Hello World');")
    connection.exec("INSERT INTO tweets VALUES(2, 'Yes it is a tweet');")
    visit('/tweets')
    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Yes it is a tweet'
  end

  scenario 'Adding a new tweet' do
    connection = PG.connect(dbname: 'chitter_test')
    Tweets.create('Hello from the void')
    visit('/tweets')
    expect(page).to have_content 'Hello from the void'
  end

  scenario 'user can view in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO tweets VALUES(1, 'Hello World');")
    connection.exec("INSERT INTO tweets VALUES(2, 'Yes it is a tweet');")
    connection.exec("INSERT INTO tweets VALUES(3, 'Yes it is another tweet');")
    visit('/tweets')
    click_on 'Sort By Oldest'
    expect('Yes it is another tweet').to appear_before('Hello World')
  end
end
