require 'PG'
require 'date'
require_relative 'user'

class Peep

  attr_reader :id, :created_at, :message, :user_id, :username

  TIME_FORMAT = '%H:%M'.freeze

  def initialize(id:, created_at:, message:, user_id:)
    @id = id
    @created_at = created_at
    @message = message
    @user_id = user_id
  end

  def Peep.all
    connection = db_connect
    peeps = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    peeps.map do |peep| 
      Peep.new(id: peep['id'], 
        created_at: post_time_format(peep['created_at']),
        message: peep['message'],
        user_id: peep['user_id'])
    end
  end
  
  def Peep.create_peep(message:, user_id:)
    connection = db_connect
    result = connection.exec_params(
      'INSERT INTO peeps (message, user_id) VALUES ($1, $2) RETURNING id, created_at, message, user_id', [message, user_id])
    Peep.new(
      id: result[0]['id'], 
      created_at: result[0]['created_at'], 
      message: result[0]['message'],
      user_id: result[0]['user_id'])
  end

  def Peep.db_connect
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'chitterbase_test')
    else 
      connection = PG.connect(dbname: 'chitterbase')
    end
  end

  def Peep.post_time_format(post_time)
    DateTime.parse(post_time).strftime(TIME_FORMAT)
  end

  def username(peep)
    User.all.each do |user|
      if user.id == peep.id
        return user.username
      end
    end
  end
  
end
