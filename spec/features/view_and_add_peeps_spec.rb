require 'pg'

feature 'Homepage' do
  scenario 'Welcomes the user with a title' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'In Viewing Peeps Page' do
  scenario 'A user can see the peeps' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO peeps (message_content) VALUES ('I had a great day');")
    connection.exec("INSERT INTO peeps (message_content) VALUES ('I feel sad');")

    visit ('/peeps')

    expect(page).to have_content "I had a great day"
    expect(page).to have_content "I feel sad"
  end
end