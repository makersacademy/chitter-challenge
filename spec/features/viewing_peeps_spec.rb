require 'pg'

feature 'View peeps' do
  scenario 'A user can see multiple peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: "This is my peep!")
    Peep.create(message: "Another peep")
    Peep.create(message: "Third peep")

    visit('/peeps')

    expect(page).to have_content 'This is my peep'
    expect(page).to have_content 'Another peep'
    expect(page).to have_content 'Third peep'
  end
end
