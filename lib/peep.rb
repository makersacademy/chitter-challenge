require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = :id
    @message = message
  end

  def self.all
    connection = check_environment
    results = connection.exec('SELECT * FROM peeps;')
    results.map { |result| {id: result['id'], message: result['message']} }
  end

  def self.create(message:)
    connection = check_environment
    result = connection.exec_params('INSERT INTO peeps (message) VALUES ($1) RETURNING message;', [message])
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

  def self.check_environment
    if ENV['DB_TEST_ENV'] == 'test'
      connection = which_db('chitter_manager_test')
    else
      connection = which_db('chitter_manager')
    end
  end

  def self.which_db(database)
    PG.connect(dbname: "#{database}")
  end


end
