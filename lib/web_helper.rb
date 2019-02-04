module Webhelper
  def self.reset
    connection = PG.connect(dbname: ENV['DATABASE'])
    result = connection.exec('TRUNCATE peeps;')
  end

  def self.add_dummy_data
    connection = PG.connect(dbname: ENV['DATABASE'])
    result = connection.exec("INSERT INTO peeps VALUES ('This is my first peep', '12:45');")
  end
end