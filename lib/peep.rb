require_relative 'database_connection'

class Peep
  attr_reader :id, :text, :time, :user_id

  def initialize(id:, text:, time:, user_id:)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
  end

  def self.create(text:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id)
     VALUES ('#{text}', '#{user_id}') RETURNING id, text, created_at, user_id;")
    Peep.new(id: result[0]['id'],
       text: result[0]['text'],
       time: result[0]['created_at'],
       user_id: result[0]['user_id'])
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps
       ORDER BY created_at DESC')
    peeps.map do |peep|
      time = Time.parse(peep['created_at']).strftime("%H:%M")
      Peep.new(id: peep['id'],
        text: peep['text'],
        time: time,
        user_id: peep['user_id'])
    end
  end

end
