feature 'Viewing the Chitter Feed' do
  scenario 'peeps should be in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    earlier_peep = Time.now - 130
    later_peep = Time.now - 70
    connection.exec("INSERT INTO users (user_id, username, name, email, password) VALUES(1, '@a','B','c@d.com','1234');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{earlier_peep}', 'A!');")
    connection.exec("INSERT INTO peeps (user_id, created, content) VALUES(1, '#{later_peep}', 'B!');")
    visit('/')
    expect(page).to have_content("B!\n1 minute ago\n@a\nA!\n2 minutes ago")
  end
end
