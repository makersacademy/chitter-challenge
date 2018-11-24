class Peep

  attr_reader :id, :username, :content, :date

  def initialize(id:, username:, content:, date:)
    @id = id
    @username = username
    @content = content
    @date = date
  end

  def self.all

  end

  def self.create(username:, content:, date:)

    result = DatabaseConnection.query("INSERT INTO peeps
      (username, date, content)
      VALUES('#{username}', '#{date}','#{content}')
      RETURNING id, username, content, date")

    Peep.new(
      id: result[0]['id'],
      username: result[0]['username'],
      content: result[0]['content'],
      date: result[0]['date'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        content: peep['content'],
        username: peep['username'],
        date: peep['date'],
        id: peep['id'])
    end
  end

end
