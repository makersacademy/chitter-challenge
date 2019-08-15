require 'pg'
require 'timecop'

feature 'viewing peeps' do
  scenario 'a user can see peeps on the homepage' do
    connection = PG.connect(dbname: 'peeps_test')

    Peep.create(content: "This is the first peep")
    Peep.create(content: "This is the second peep")

    visit ('/')
    expect(page).to have_content  "This is the first peep"
    expect(page).to have_content  "This is the second peep"

  end

  scenario 'a user can see the peeps in reverse chronological order' do

    connection = PG.connect(dbname: 'peeps_test')

    Peep.create(content: "This is the first peep")
    Peep.create(content: "This is the second peep")

    visit('/')
    # expect(first('.peep')).to have_content "This is the second peep"
    expect(all('li')[0].text).to have_content "This is the first peep"
  end

  # scenario 'a user can see the time each peep was posted' do
  # before do
  #   Timecop.freeze(Time.now)
  # end
  # after do
  #   Timecop.return
  # end
  #
  #
  # end


end
