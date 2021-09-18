require 'pg'
require_relative 'supporting_class'


class ChitterFeed 

  attr_reader :id, :name, :message, :time

  def initialize(id:, name:, message:, time:)
    @id = id
    @name = name
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("SELECT * FROM chitter;")
    result.map do |input| 
      ChitterFeed.new(id: input['id'], name: input['name'], message: input['message'], time: input['time'])
    end
  end

  def self.post(peep:)
    @name = AncilliaryClass.new.avatar
    @time = AncilliaryClass.new.time_date

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("INSERT INTO chitter (name, message ,time) VALUES('#{@name}','#{peep}','#{@time}') RETURNING id, name, message, time;")
    
    ChitterFeed.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], time: result[0]['time'])
  end 



end 
