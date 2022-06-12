class Peep
  attr_reader :content, :time_created

  def initialize(id, content, time_created)
    @id = id
    @content = content
    @time_created = Time.parse(time_created).strftime('%A %d %B %Y, %I:%M%p')
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map {|peep| Peep.new(peep['id'], peep['content'], peep['time_created'])}
  end

  def self.create(content:, time_created: Time.now)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (content, time_created) VALUES($1, $2) RETURNING id, content, time_created",
      [content, time_created]
    )
    Peep.new(result[0]['id'], result[0]['content'], result[0]['time_created'])
  end
end