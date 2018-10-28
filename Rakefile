require 'pg'

task :setup do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    Dir.foreach("./db/migrations/") do |fname|
      connection.exec("#{File.open("./db/migrations/#{fname}"){ |file| file.read }}") if fname.end_with?('.sql')
    end
  end
end

task :setup_test_data do

  truncate_database = "TRUNCATE Users;"

  # create_tags =       "INSERT INTO Tags(id, name)"\
  #                     "VALUES"\
  #                     "('1', 'Happy'),"\
  #                     "('2', 'Sad'),"\
  #                     "('3', 'Achievment'),"\
  #                     "('4', 'Regret'),"\
  #                     "('5', 'Sport'),"\
  #                     "('6', 'Love');"
  #
  # create_entries =    "INSERT INTO Entries(id, title, body)"\
  #                     "VALUES"\
  #                     "('1', 'First Entry', 'Test first body'),"\
  #                     "('2', 'Second Entry', 'Test second Body'),"\
  #                     "('3', 'Third Entry', 'Test third Body');"
  #
  # create_entry_tags = "INSERT INTO EntryTags(entry_id, tag_id)"\
  #                     "VALUES"\
  #                     "('1', '1'),"\
  #                     "('1', '2'),"\
  #                     "('1', '3');"
  #
  # create_comments =   "INSERT INTO Comments(id, body, entry_id)"\
  #                     "VALUES"\
  #                     "('1', 'Fist comment', 1),"\
  #                     "('2', 'Second comment', 1),"\
  #                     "('3', 'Third comment', 1);"

  create_users =      "INSERT INTO Users(id, first_name, last_name, email, password)"\
                      "VALUES"\
                      "('1', 'Harry', 'Enfield', 'harry@enfield.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK'),"\
                      "('2', 'Jim', 'Carey', 'jim@carey.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK'),"\
                      "('3', 'John', 'Cleese', 'john@cleese.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK');"

  q = truncate_database
  q += create_users

  connection = PG.connect(dbname: 'diary_test').exec(q)
end
