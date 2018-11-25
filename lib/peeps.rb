require_relative '../database_connection_setup'
require 'pg'

class Peeps
attr_reader :id, :username, :context, :date, :time

  def initialize(id:, username:, context:, date:, time:)
    @id = id
    @username = username
    @context = context
    @date = date
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
    else
        connection = PG.connect(dbname: 'chitter')
    end
    peeps_list = connection.exec("SELECT * FROM peeps;")

    peeps_list.map do |peeps|
      Peeps.new(id: peeps['id'], username: peeps['username'], context: peeps['context'], date: peeps['date'], time: peeps['time'])
    end
  end

  def self.post(context)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
    else
        connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec("INSERT INTO peeps(context, time) VALUES('#{context}','#{Time.now.asctime}') RETURNING id, username, context, date, time;")
    Peeps.new(id: peeps[0]['id'], username: peeps[0]['username'], context: peeps[0]['context'], date: peeps[0]['date'], time: peeps[0]['time'])
  end
end
