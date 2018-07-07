require 'pg'

class Peep

  def self.all
    Peep.check_environment
    result = @connection.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map { |peep| peep['comment'] }
  end

  def self.create(options)
    Peep.check_environment
    @connection.exec(
      "INSERT INTO peeps (comment)
      VALUES('#{options[:comment]}')"
    )

  end

  def self.check_environment
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
