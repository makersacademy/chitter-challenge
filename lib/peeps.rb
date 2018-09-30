require_relative 'database_connection'

class Peeps

  def self.all
    peeps = DatabaseConnection.exec("SELECT * FROM peeps")
    result = peeps.map do |peep|
      Peeps.new(peep['id'], peep['content'], peep['time'])
    end
    result.sort { |x,y| y.time <=> x.time }
  end

  def self.create(content)
    DatabaseConnection.exec("INSERT INTO peeps (content, time) VALUES ('#{content}', '#{Time.new}')")
  end

  def initialize(id,content,time)
    @id = id
    @content = content
    @time = time
  end

  attr_reader :id, :content, :time
end
