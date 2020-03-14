require 'pg'

feature 'Seeing peeps' do
  scenario 'I want to see all peeps in chitter in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('I am the first peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('I am the second peep');")

    visit('/chitter')
    
    # Test the reverse chronological order
    expect(page.find('li:nth-child(1)')).to have_content 'I am the second peep'
    expect(page.find('li:nth-child(2)')).to have_content 'I am the first peep'
  end
end

# feature 'Posting a peep' do
#   scenario 'I can post a peep in chitter' do
#
#   end
# end
