require 'pg'
require 'timecop'
require 'time'

feature 'viewing peeps' do
  scenario 'a user can see peeps on the homepage' do
    connection = PG.connect(dbname: 'peeps_test')

    Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')
    Peep.create(content: "This is the second peep", name: 'testname', username: 'testusername')

    visit ('/')
    expect(page).to have_content  "This is the first peep"
    expect(page).to have_content  "This is the second peep"

  end

  scenario 'a user can see the peeps in reverse chronological order' do

    connection = PG.connect(dbname: 'peeps_test')



    Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')
    Peep.create(content: "This is the second peep", name: 'testname', username: 'testusername')

    visit('/')
    #expect(first('.peep')).to have_content "This is the second peep"
    expect(all('li')[1].text).to have_content "This is the second peep"
  end





  feature 'a user can see the time each peep was posted' do
  before do
    Timecop.freeze(Time.now)
  end
  # after do
  #   Timecop.return
  # end

  scenario 'a user can see the time each peep was posted' do

  connection = PG.connect(dbname: 'peeps_test')

  Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')

  visit('/')
  expect(all('li')[0].text).to have_content Time.now.strftime("%H:%M")

  end
end
end
