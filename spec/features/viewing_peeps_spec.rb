# require 'pg'
# # As a maker
# # So that I can see what others are saying
# # I want to see all peeps in reverse chronological order
# feature '2. Viewing Peeps' do
#   scenario '2.1 Viewing peeps' do
#     connection = PG.connect(dbname: 'chitter_test')
#     connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 1')")
#     connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 2')")
#     connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 3')")
#     visit '/peeps'
#     expect(page).to have_content 'This is peep 1'
#     expect(page).to have_content 'This is peep 2'
#     expect(page).to have_content 'This is peep 3'
#   end
# end
