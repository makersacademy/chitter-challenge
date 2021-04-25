# require 'pg'

# feature 'View peeps' do
#   scenario 'A user can see peeps' do
#     connection = PG.connect(dbname: 'chitter_test')

#     connection.exec("INSERT INTO peeps (content) VALUES('My first peep');")
#     connection.exec("INSERT INTO peeps (content) VALUES('My second peep');")

#     visit('/peeps')

#     expect(page).to have_content "My first peep"
#     expect(page).to have_content "My second peep"
#   end
# end