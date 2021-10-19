# feature 'viewing peeps' do 
#   scenario 'see list of peeps' do 
#     visit('/peeps')
#     expect(page).to have_content 'I am a great Peep'
#     expect(page).to have_content 'I am another Peep'
#   end 
# end 

require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (content) VALUES('I am another Peep');")
    connection.exec("INSERT INTO peeps (content) VALUES('I am another Peep');")

    visit('/peeps')

    expect(page).to have_content "I am another Peep"
    expect(page).to have_content "I am another Peep"
  end
end