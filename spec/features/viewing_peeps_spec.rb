feature "Viewing Peeps" do
  scenario "Can visit page and see peeps" do
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('email@email.com', 'password', 'will', 'itswill') RETURNING id;")
    connection.exec("INSERT INTO peeps (time, text, user_id) VALUES ('#{Time.now}', 'I just ate an apple', '#{result[0]['id']}');")
    connection.exec("INSERT INTO peeps (time, text, user_id) VALUES ('#{Time.now}', 'Chitter is the best', '#{result[0]['id']}');")
    connection.exec("INSERT INTO peeps (time, text, user_id) VALUES ('#{Time.now}', 'Howdy', '#{result[0]['id']}');")
    visit ('/peeps')
    expect(page).to have_content "I just ate an apple"
    expect(page).to have_content "Chitter is the best"
    expect(page).to have_content "Howdy"
  end
end
