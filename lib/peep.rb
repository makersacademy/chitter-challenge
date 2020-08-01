require_relative 'database_connection.rb'

class Peep

  attr_reader :id, :content, :date

  def initialize(id:, content:, date:)
    @id = id
    @content = content
    @date = date
  end

  def self.create(content:, date: Time.new.strftime("%Y-%m-%d %H:%M:%S"))
    result = DatabaseConnection.query("INSERT INTO peeps (content, date) VALUES('#{content}', '#{date}') RETURNING id, content, date")
      Peep.new(id: result[0]['id'], content: result[0]['content'], date: result[0]['date'])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], date: peep['date'])
    end
  end


end
