require_relative "database_manager"

class Peep
  attr_reader :id, :text, :time
  
  def self.all
    select_all.map do |peep|
      Peep.new(peep['id'], peep['text'], peep['time'])
    end
  end

  def self.create(text)
    DatabaseManager.query("INSERT INTO peeps(text,time)" \
      "VALUES('#{text}','#{format(Time.now)}') RETURNING id, text, time")
  end

  def self.format(time)
    time.strftime('%d %b %Y, %H:%M')
  end

  def self.select_all
    DatabaseManager.query('SELECT * FROM peeps')
  end

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  private_class_method :format, :select_all
end
