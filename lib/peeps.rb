require_relative '../database_connection_setup'
require 'pg'

class Peeps
attr_reader :id, :username, :context, :time

  def initialize(id:, username:, context:, time:)
    @id = id
    @username = username
    @context = context
    @time = time
  end

  if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
  else
      @connection = PG.connect(dbname: 'chitter')
  end

  def self.all
    peeps_list = @connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    peeps_list.map do |peeps|
      Peeps.new(
        id: peeps['id'],
        username: peeps['username'],
        context: peeps['context'],
        time: peeps['time'])
    end
  end

  def self.post(context)
    peeps = @connection.exec("INSERT INTO peeps(context, time) VALUES('#{context}','#{Time.now.asctime}') RETURNING id, username, context, time;")
    Peeps.new(
      id: peeps[0]['id'],
      username: peeps[0]['username'],
      context: peeps[0]['context'],
      time: peeps[0]['time'])
  end

end
