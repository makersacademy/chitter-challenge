# home page
require 'pg'

feature 'Viewing home page' do
  scenario 'Introductory title' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_content 'Peepdeck'
  end
end

# feature 'Viewing home page' do
#   scenario 'Shows peepdeck' do
#     visit('/')
#     expect(page).to have_content 'My first peep!'
#   end
# end

feature 'Viewing home page' do
  scenario 'Shows peepdeck' do
    connection = PG.connect(dbname: 'chitter_app_test')

    # add the test data
    connection.exec("INSERT INTO chitter VALUES(1, 'My first peep!');")

    visit('/')
    expect(page).to have_content 'My first peep!'
  end
end
