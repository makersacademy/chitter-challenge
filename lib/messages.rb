require_relative 'user'

class Messages
  def self.create(user_id:, message:)

    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO Messages (user_id, message) VALUES($1, $2) RETURNING id, user_id, message;", [user_id, message])
    Messages.new(id: result[0]['id'], user_id: result[0]['user_id'], message: result[0]['message'])

  end

  attr_reader :id, :user_id, :message

  def initialize(id:, user_id:, message:)
    @id = id
    @user_id = user_id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("SELECT * FROM Messages INNER JOIN Username ON Username.id = Messages.user_id ORDER BY Username;")
    # Messages.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'])

  end

end