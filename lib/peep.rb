class Peep

  attr_reader :comment

  def initialize(comment:)
    @comment = comment
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter-challenge-test')
    else
      connection = PG.connect(dbname: 'chitter-challenge')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |row|
      Peep.new(comment: row['comment'])
    end
  end

  def self.create(comment:)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'chitter-challenge-test')
    else
     connection = PG.connect(dbname: 'chitter-challenge')
    end
    # created_at = Peeps.current_time
    connection.exec("INSERT INTO peeps (comment) VALUES('#{comment}') RETURNING comment")
  end
end
