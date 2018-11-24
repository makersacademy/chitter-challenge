class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY tstz DESC;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'],
        user_id: peep['user_id'],
        tstz: peep['tstz']
      )
    end
  end

  def self.create(text:, user_id:, tstz: Time.now)
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id, tstz) VALUES('#{text}', '#{user_id}', '#{tstz}') RETURNING id, text, tstz, user_id;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      user_id: result[0]['user_id'],
      tstz: result[0]['tstz']
    )
  end

  attr_reader :id, :text, :user_id, :tstz

  def initialize(id:, text:, user_id:, tstz:)
    @id = id
    @text = text
    @user_id = user_id
    @tstz = tstz
  end

end
