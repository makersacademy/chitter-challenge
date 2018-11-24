class Peep

  def self.create(text:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id) VALUES('#{text}', '#{user_id}') RETURNING id, text, tstz, user_id;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      tstz: result[0]['tstz'],
      user_id: result[0]['user_id']
    )
  end

  attr_reader :id, :text, :tstz, :user_id

  def initialize(id:, text:, tstz:, user_id:)
    @id = id
    @text = text
    @tstz = tstz
    @user_id = user_id
  end

end
