require 'timecop'

feature 'Display peep creation time' do

  first_time = Time.now
  Timecop.freeze(first_time)
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE peeps;
  INSERT INTO peeps (string, dateCreated) VALUES ('This is my first peep', '#{Time.now}');")
  Timecop.return

  second_time = Time.now
  DatabaseConnection.query("
  INSERT INTO peeps (string, dateCreated) VALUES ('This is my second peep', '#{Time.now}');")
  Timecop.return

  scenario 'Peeps are displayed next to their time of creation' do
    visit('/')
    expect(page).to have_content(first_time.strftime("%Y-%m-%d %H:%M:%S"))
    expect(page).to have_content(second_time.strftime("%Y-%m-%d %H:%M:%S"))
  end
end
