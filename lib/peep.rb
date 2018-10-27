class Peep
  attr_reader :id, :text, :user_id
  def initialize(id:, text:, user_id:)
    @id = id
    @text = text
    @user_id = user_id
  end

  def self.create(text:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, user_id) "\
      "VALUES('#{text}', '#{user_id}') "\
      "RETURNING id, text, user_id;").first
    Peep.new(
      id: result['id'],
      text: result['text'], 
      user_id: result['user_id']
    )
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'], 
        user_id: peep['user_id']
      )
    end
  end
end
