def add_peep
  connection = PG.connect(dbname: 'chitter_test_db')
  connection.exec("INSERT INTO messages(name, message) VALUES('James', 'This is my very first peep!');")
end

def post_message
  visit('/')
  fill_in :message, with: 'Hello Chitter!'
  fill_in :user, with: 'James'
  click_button 'Submit'
end