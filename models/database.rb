class Database

  def self.connect
    if ENV['RACK_ENV'] == "test"
      @@connection = PG.connect :dbname => 'peeps_test_manager'
    else
      @@connection = PG.connect :dbname => 'peeps_manager'
    end
  end

  def self.select_all
    @@connection.exec "SELECT * FROM peeps"
  end

  def self.add_with_return_values(message, creator)
    @@connection.exec("INSERT INTO peeps 
      (message, creator) VALUES ('#{message}', '#{creator}') 
      RETURNING id, message, creator, time_created;"
    )
  end

end