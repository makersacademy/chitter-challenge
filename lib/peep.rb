require_relative "database_manager"

class Peep
  def self.all
    ['My first peep']
  end

  def self.create(text)
    DatabaseManager.query("INSERT INTO peeps(text,time)" \
      "VALUES('#{text}','#{format(Time.now)}') RETURNING id, text, time")
  end

  def self.format(time)
    time.strftime('%d %b %Y, %H:%M')
  end

  private_class_method :format
end
