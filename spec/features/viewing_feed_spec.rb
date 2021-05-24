feature 'Viewing chitter feed' do
  scenario 'visiting the feed page' do
    visit('/')
    expect(page).to have_content "Currently Trending:"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    connection = PG.connect(dbname: 'Chitter_feed_test')

    #connection.exec("INSERT INTO peeps (message) VALUES ('peeps');")
    #connection.exec("INSERT INTO peeps (message) VALUES('hellow world');")
    Peep.create(message: 'peeps')
    Peep.create(message: 'hello world')

    visit('/peeps')

    expect(page).to have_content "peeps"
    expect(page).to have_content "hello world"
  end
end