require 'pg'

class Peeps

  attr_reader :comment, :created_at

  def initialize(comment: ,created_at:)
    @comment = comment
    @created_at = created_at
  end

  def self.current_time
    time = Time.new
    time.strftime("%A, %B %e, %Y, %k:%M")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |row|
      Peeps.new(comment: row['comment'], created_at: row['created_at'])
    end
  end

  def self.create(comment:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    created_at = Peeps.current_time
    connection.exec("INSERT INTO peeps (comment, created_at) VALUES('#{comment}', '#{created_at}') RETURNING comment, created_at")
  end
end
