def setup_test_db
  connection = PG.connect :dbname => 'chitter_test'
  connection.exec "TRUNCATE TABLE peeps"
  ChitterHandler::DEFAULT_PEEPS.each do |text|
    ChitterHandler.add_peep text
  end
end
