require 'pg'

class Peep

  attr_reader :content, :time_stamp

  def initialize(content:, time_stamp:)
    @content = content
    @time_stamp = time_stamp
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")

    peeps.map { |peep| 
      Peep.new(content: peep['content'],
        time_stamp: peep['time_stamp'])
    }
  end

  def self.create(content:)
   peep_create = DatabaseConnection.query(
    "INSERT INTO peeps (content) VALUES('#{content}')"
   )
  end
end