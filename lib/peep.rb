class Peep
  attr_reader :id, :text, :user_id, :time
  def initialize(id:, text:, user_id:, time:)
    @id = id
    @text = text
    @user_id = user_id
    @time = time
  end

  def self.create(text:, user_id:)
    time = Peep.timestamp
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, user_id, time) "\
      "VALUES('#{text}', '#{user_id}', '#{time}') "\
      "RETURNING id, text, user_id, time;").first
    Peep.new(
      id: result['id'],
      text: result['text'], 
      user_id: result['user_id'],
      time: result['time']
    )
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'], 
        user_id: peep['user_id'],
        time: peep['time']
      )
    end
  end

  def self.timestamp
    Time.new.strftime("%H:%M")
  end
end
