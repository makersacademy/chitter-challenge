class Peep

  attr_reader :comment, :posted_at

  def initialize(comment:, posted_at:)
    @comment = comment
    @posted_at = posted_at
  end

  def self.current_time
    time = Time.new
    time.strftime("%A, %B %e, %Y, %k:%M")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter-challenge-test')
    else
      connection = PG.connect(dbname: 'chitter-challenge')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |row|
      Peep.new(comment: row['comment'], posted_at: row['posted_at'], )
    end
  end

  def self.create(comment:)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'chitter-challenge-test')
    else
     connection = PG.connect(dbname: 'chitter-challenge')
    end
    posted_at = Peep.current_time
    connection.exec("INSERT INTO peeps (comment, posted_at) VALUES('#{comment}', '#{posted_at}') RETURNING comment, posted_at")
  end
end
