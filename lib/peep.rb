class Peep

  attr_reader :message, :username, :name, :time

  def initialize(message, time, username, name)
    @message = message
    @username = username
    @name = name
    time = Time.now.strftime("%d-%m-%Y %H:%M")
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    array = result.map { |hash| Peep.new(hash['message'], hash['time'], hash['username'], hash['name']) }
    array.reverse
  end

  def self.add(message)
    DatabaseConnection.query("INSERT INTO peeps (message, time) VALUES('#{message}', '#{Time.now}')")
  end

end
