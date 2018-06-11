require 'pg'

class Peep
  attr_accessor :id, :peep, :time_posted

  def initialize(id, peep, time_posted)
    @id = id
    @peep = peep
    @time_posted = time_posted
  end

  def self.post(options)
    result = database.exec("INSERT INTO peeps (peep) VALUES('#{options[:peep]}') RETURNING id, peep, time_posted")
    Peep.new(result.first['id'], result.first['peep'], result.first['time_posted'])
  end

  def self.showpeeps
    result = database.exec("SELECT * FROM peeps")
    result.map { |peeps| Peep.new(peeps['id'], peeps['peep'], peeps['time_posted']) }
  end

  def ==(other)
    @id == other.id
  end

  private_class_method

  def self.database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
