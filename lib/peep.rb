require 'pg'

class Peep
  attr_reader :id, :peep, :user, :created_at

  def initialize(id, peep, user, created_at)
    @id = id
    @peep = peep
    @user = user
    @created_at = created_at
  end

  def self.post(options)
    return false if too_long?(options[:peep])
    connection = database_connection
    result = connection.exec("INSERT INTO peeps (peep, username) \
    VALUES('#{options[:peep]}', '#{options[:user]}') \
    RETURNING id, peep, username, created_at")
    Peep.new(result.first['id'], result.first['peep'], \
    result.first['username'], result.first['created_at'])
  end

  def self.display
    connection = database_connection
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peeps| Peep.new(peeps['id'], peeps['peep'], \
                 peeps['username'], peeps['created_at'])
    }
  end

  def ==(other)
    @id == other.id
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  private_class_method
  def self.too_long?(peep)
    peep.length > 140
  end
end
