require 'pg'
class Peep

  # attr_reader :id, :pmessage
  #
  # def initialize(id:, pmessage:)
  #   @id = id
  #   @pmessage = pmessage
  # end

  def self.all
    if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'chitterweb_test')
  else
    connection = PG.connect(dbname: 'chitterweb')
  end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['pmessage'] }

    end


  def self.create(pmessage:)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitterweb_test')
    else
      connection = PG.connect(dbname:'chitterweb')
    end
    connection.exec("INSERT INTO peeps (pmessage) VALUES('#{pmessage}')")
  end
end
