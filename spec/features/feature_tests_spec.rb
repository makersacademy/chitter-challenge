require 'pg'

feature 'Seeing peeps' do
  scenario 'I want to see all peeps in chitter in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('I am the first peep');")

    visit('/chitter')
    expect(page).to have_content('I am the first peep')
  end
end

# feature 'Posting a peep' do
#   scenario 'I can post a peep in chitter' do
#
#   end
# end
