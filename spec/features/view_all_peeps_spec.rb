require 'pg'

feature 'Viewing all peeps' do
  scenario 'A user can see other peeps' do
    conn = PG.connect(dbname: 'chitter_test')

    # Add the test data
    Peeps.create(message: 'Hi, im tired!')
    Peeps.create(message: 'Hi, life has bein good!')
    # conn.exec("INSERT INTO chitter (message) VALUES('Hi, im tired!');")
    # conn.exec("INSERT INTO chitter (message) VALUES('Hi, life has bein good!');")

    visit('/peeps')

    expect(page).to have_content "Hi, im tired!"
    expect(page).to have_content "Hi, life has bein good!"
  end
end