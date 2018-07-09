require 'pg'

class Message
  attr_reader :id, :message, :date, :user_id

  def initialize(id, message, date, user_id)
    @id = id
    @message = message
    @date = date
    @user_id = user_id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    # get data from database, return the result by reverse chronological order
    result = connection.exec("SELECT * FROM messages ORDER BY date asc")

    # The result object contains the Message, each of which is a hash of the
    # Message ID,  message and date. We map each hash to the id, message,
    # date keys of the hash. This gives us an array of the messages
    # # we return the data, wrapped in a instance

    result.map {
      |message| Message.new(message['id'], message['message'],
      message['date'], message['user_id'])
    }
  end

  def self.create(user_id, params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    # We are RETURNING the id, message, date, user_id from the message we just inserted into
    # the database and then wrapping it to a Message instance

    result = connection.exec("INSERT INTO messages (message, date, user_id) VALUES('#{params[:message]}', '#{params[:date]}', '#{user_id}') RETURNING
    id, message, date, user_id")
    Message.new(result.first['id'], result.first['message'],
      result.first['date'], result.first['user_id'])
  end

  def users
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM users WHERE id = #{@user_id} ")
    result.map { |user| User.new(result.first['id'],
      result.first['first_name'], result.first['last_name'],
      result.first['date'])
    }
  end

  def ==(other)
    @id == other.id
  end
end
