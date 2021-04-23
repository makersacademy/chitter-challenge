feature 'Viewing tweets' do 
  scenario 'visiting the home page' do 
    visit('/')
    expect(page).to have_content "Hello and welcome to Chitty Chitty Bang Bang"
    expect(page).to have_selector(:link_or_button, 'View Tweets')
  end

  scenario 'Viewing all tweets' do 
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO tweets VALUES(1, 'Hello World');")
    connection.exec("INSERT INTO tweets VALUES(2, 'Yes it is a tweet');")
    visit('/tweets')
    expect(page).to have_content "Hello World"
    expect(page).to have_content "Yes it is a tweet"
  end

  scenario 'Adding a new tweet' do 
    connection = PG.connect(dbname: 'chitter_test')
    t = Tweets.create("Hello from the void")
    visit('/tweets')
    expect(page).to have_content "Hello from the void"
  end
end