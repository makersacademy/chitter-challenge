require 'pg'

class Peep

  attr_reader :comment, :time, :id

  def initialize(comment, time, id)
    @comment = comment
    @time = time
    @id = id
  end

  def self.all
    Peep.check_environment
    result = @connection.exec("SELECT *
              FROM peeps ORDER BY time DESC")
    result.map { |peep| Peep.new(peep['comment'], peep['time'], peep['id']) }
  end

  def self.create(options)
    Peep.check_environment
    result = @connection.exec(
      "INSERT INTO peeps (comment, time)
      VALUES('#{options[:comment]}', '#{Peep.time_date}') RETURNING comment, time, id"
    )
    Peep.new(result.first['comment'], result.first['time'], result.first['id'])
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
