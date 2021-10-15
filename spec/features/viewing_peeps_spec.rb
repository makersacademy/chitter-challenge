require 'timecop'

feature 'Viewing peeps' do
  scenario 'A user can see a list of all peeps' do 
    connection = PG.connect(dbname: 'chitter_test')
    time = Time.now.utc
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 1', '#{time}');")
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 2', '#{time}');")
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 3', '#{time}');")

    visit('/')

    expect(page).to have_content('peep 1')
    expect(page).to have_content('peep 2')
    expect(page).to have_content('peep 3')
  end

  scenario 'The peeps are shown in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 1', '#{Timecop.freeze(Time.utc(2019))}');")
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 2', '#{Timecop.freeze(Time.utc(2020))}');")
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 3', '#{Timecop.freeze(Time.utc(2021))}');")

    visit('/')

    expect(page).to have_content(
      "peep 3 00:00 am · 01 Jan 2021 "\
      "peep 2 00:00 am · 01 Jan 2020 "\
      "peep 1 00:00 am · 01 Jan 2019"
    ) # they are in a html list (and shown as one) but expect_content views them as a single line

    Timecop.return # just incase
  end
end
