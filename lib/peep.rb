require 'pg'
require_relative 'user'

class Peep

  attr_reader :id, :message, :post_time

  def initialize(id:, message:, post_time:)
    @id = id
    @message = message
    @post_time = post_time
  end

  def self.all
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], post_time: peep['post_time'])
    end
  end

  def self.create(message:, post_time:)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec_params("INSERT INTO peeps (message, post_time) VALUES($1, $2) RETURNING id, message, post_time;", [message, post_time])
    Peep.new(id: result[0]['id'], message: result[0]['message'], post_time: result[0]['post_time'])
  end

end
