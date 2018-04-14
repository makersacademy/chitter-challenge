require 'pg'
require 'pry'



class Peep

  attr_reader :peep_text, :name, :handle

  def initialize(peep_text, name, handle)
    @peep_text = peep_text
    @name = name
    @handle = handle
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peep")
    result.map { |peep| peep }
  end

  def self.create(peep)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peep (peep_text, name, handle) VALUES('#{peep.peep_text}', '#{peep.name}', '#{peep.handle}');")
  end

end
