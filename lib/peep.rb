require 'pg'

class Peep

  attr_reader :comment, :time, :id, :user

  def initialize(comment, time, id, user)
    @comment = comment
    @time = time
    @id = id
    @user = user
  end

  def self.all
    Peep.check_environment
    result = @connection.exec("SELECT peeps.comment, peeps.time, peeps.id, users.username AS username FROM peeps INNER JOIN users ON peeps.user_id = users.id ORDER BY time DESC")
    result.map { |peep| Peep.new(peep['comment'], peep['time'], peep['id'], peep['username']) }
  end

  def self.create(options)
    Peep.check_environment
    result = @connection.exec(
      "INSERT INTO peeps (comment, time, user_id )
      VALUES('#{options[:comment]}', '#{Peep.time_date}', '#{options[:user_id]}' ) RETURNING comment, time, id, user_id"
    )
    Peep.new(result.first['comment'], result.first['time'], result.first['id'], result.first['user_id'] )
  end

  def self.check_environment
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.time_date
    Time.now
  end

  def ==(other)
    @id == other.id
  end


end
