class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'],
        user_id: peep['user_id']
      )
    end
  end

  def self.create(text:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id) VALUES('#{text}', '#{user_id}') RETURNING id, text, tstz, user_id;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      user_id: result[0]['user_id']
    )
  end

  attr_reader :id, :text, :user_id

  def initialize(id:, text:, user_id:)
    @id = id
    @text = text
    @user_id = user_id
  end

end
