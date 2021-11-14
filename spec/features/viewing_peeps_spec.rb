require 'pg'

feature 'View peeps' do
  let(:time) {Time.now}

  scenario 'A user can see multiple peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: "This is my peep!", time: :time)
    Peep.create(message: "Another peep", time: :time)
    Peep.create(message: "Third peep", time: :time)

    visit('/peeps')

    expect(page).to have_content 'This is my peep'
    expect(page).to have_content 'Another peep'
    expect(page).to have_content 'Third peep'
  end
end
