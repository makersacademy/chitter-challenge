class Peep
  attr_reader :id, :content, :time_created, :user_id

  def initialize(id, content, time_created, user_id)
    @id = id
    @content = content
    @time_created = Time.parse(time_created).strftime('%A %d %B %Y, %I:%M %p')
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map {|peep| Peep.new(peep['id'], peep['content'], peep['time_created'], peep['user_id'])}
  end

  def self.create(content:, time_created: Time.now, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (content, time_created, user_id) VALUES($1, $2, $3) RETURNING id, content, time_created, user_id",
      [content, time_created, user_id]
    )
    Peep.new(result[0]['id'], result[0]['content'], result[0]['time_created'], result[0]['user_id'])
  end
end