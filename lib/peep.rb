require 'pg'

class Peep

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def self.add(text)
    if ENV["ENVIRONMENT"] = 'test'
      connection = PG.connect(dbname: "chitter_manager_test")
    else
      connection = PG.connect(dbname: "chitter_manager")
    end
    connection.exec_params("INSERT INTO chitters (text) VALUES ($1)",[text])
  end

  def self.all
    if ENV["ENVIRONMENT"]= 'test'
      connection = PG.connect(dbname: "chitter_manager_test")
    else
      connection = PG.connect(dbname: "chitter_manager")
    end
    result = connection.exec("SELECT * FROM chitters")
    result.map { |chitter| chitter['text'] }
  end

end