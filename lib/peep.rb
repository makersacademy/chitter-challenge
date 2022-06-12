class Peep
  attr_reader :content, :time_created

  def initialize(content, time_created)
    @content = content
    @time_created = Time.parse(time_created).strftime('%A %d %B %Y, %I:%M%p')
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps", [])
    result.map {|peep| Peep.new(peep['content'], peep['time_created'])}
  end

  def self.create(content:, time_created: Time.now.to_s)
    result = DatabaseConnection.query("INSERT INTO peeps (content, time_created) VALUES($1, $2)", [content, time_created])
    Peep.new(content, time_created)
  end
end