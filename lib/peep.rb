require 'pg'
require_relative 'user'

class Peep

  attr_reader :id, :name, :username, :message, :post_time

  def initialize(id:, name:, username:, message:, post_time:)
    @id = id
    @name = name
    @username = username
    @message = message
    @post_time = post_time
  end

  def self.all
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], username: peep['username'], message: peep['message'], post_time: peep['post_time'])
    end
  end

  def self.create(name:, username:, message:, post_time:)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec_params("INSERT INTO peeps (name, username, message, post_time) VALUES($1, $2, $3, $4) RETURNING id, name, username, message, post_time;", [name, username, message, post_time])
    Peep.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], message: result[0]['message'], post_time: result[0]['post_time'])
  end

end
