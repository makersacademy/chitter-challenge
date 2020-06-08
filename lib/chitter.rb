require 'pg'

class Chitter

  attr_reader :context, :time

  def initialize(context, time)
    @context = context
    @time = Time.parse(time).strftime("%k:%M")
  end

  def self.create(context)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("INSERT INTO peeps (context) VALUES ('#{context}');")
  end

  def self.view
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map { |peep| Chitter.new(peep['context'], peep['time_added']) }
  end
end
