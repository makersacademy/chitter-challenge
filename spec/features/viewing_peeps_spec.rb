require 'pg'
require 'timecop'

feature 'viewing peeps' do
  scenario 'a user can see peeps and the time they were posted on the homepage' do
    connection = PG.connect(dbname: 'peeps_test')

    Peep.create(content: "This is the first peep")
    Peep.create(content: "This is the second peep")


    # connection.exec("INSERT INTO peeps (content) VALUES ('This is the first peep');")
    # connection.exec("INSERT INTO peeps (content) VALUES ('This is the second peep');")

    visit ('/')
    expect(page).to have_content  "This is the first peep"
    expect(page).to have_content  "This is the second peep"

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
