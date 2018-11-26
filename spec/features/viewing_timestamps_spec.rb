feature 'Viewing the Chitter Feed' do
  scenario 'peeps should have a time stamp' do
    connection = PG.connect(dbname: 'chitter_test')
    one_minute_ago = Time.now - 70
    two_minutes_ago = Time.now - 130
    one_hour_ago = Time.now - 3610
    two_hours_ago = Time.now - 7210
    one_day_ago = Time.now - 86410
    two_days_ago = Time.now - 172810
    connection.exec("INSERT INTO users (user_id, username, name, email, password) VALUES(1, '@a','B','c@d.com','1234');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{one_minute_ago}', 'A!');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{two_minutes_ago}', 'B!');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{one_hour_ago}', 'C!');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{two_hours_ago}', 'D!');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{one_day_ago}', 'E!');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{two_days_ago}', 'F!');")
    visit('/')
    expect(page).to have_content("A!\n1 minute ago\n@a\nB!\n2 minutes ago")
    expect(page).to have_content("B!\n2 minutes ago\n@a\nC!\n1 hour ago")
    expect(page).to have_content("C!\n1 hour ago\n@a\nD!\n2 hours ago")
    expect(page).to have_content("D!\n2 hours ago\n@a\nE!\n1 day ago")
    expect(page).to have_content("E!\n1 day ago\n@a\nF!\n2 days ago")
    expect(page).to have_content("F!\n2 days ago")
  end
end
