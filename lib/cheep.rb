require 'pg'

class Cheep

  TEST_DB = 'chitter_test'
  PROD_DB = 'chitter'

  attr_reader :name, :handle, :message, :time, :id

  def initialize(name, handle, message, time, id)
    @name = name
    @handle = handle
    @message = message
    @time = time
    @id = id
  end

  def self.create(name, handle, message, time = Time.now)
    connection = PG.connect(dbname: "#{self.set_database}")
    result = connection.exec(self.add_to_database(name, handle, message, time))
    Cheep.new(result.first['name'], result.first['handle'],
              result.first['message'], result.first['time'], result.first['id'])
  end

  def self.all
    connection = PG.connect(dbname: "#{self.set_database}")
    result = connection.exec(self.return_data)
    result.map do |cheep|
      Cheep.new(cheep["name"], cheep["handle"], cheep["message"], cheep["time"], cheep["id"])
    end
  end

  private

  def self.set_database
    ENV['ENVIRONMENT'] == 'test' ? TEST_DB : PROD_DB
  end

  def self.add_to_database(name, handle, message, time)
    "INSERT INTO cheeps VALUES('#{name}','#{handle}','#{message}','#{time}', DEFAULT)
    RETURNING name, handle, message, time, id"
  end

  def self.return_data
    "SELECT * FROM cheeps"
  end

end
