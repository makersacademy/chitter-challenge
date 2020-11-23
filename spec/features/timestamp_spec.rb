require 'pg'

feature 'Seeing timestamp' do
  scenario 'Seeing when peeps were created' do
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(post: 'Test peep')

    visit('/peeps')
    expect(page).to have_content('Test peep')
    expect(page).to have_content Time.now.strftime("%Y/%m/%d %k:%M")
  end
end
