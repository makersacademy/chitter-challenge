require './lib/database_connection'

class Peep
  attr_reader :text, :user_id, :id, :time
  def initialize(id:, text:, user_id:, time:)
    @text = text
    @user_id = user_id
    @id = id
    @time = time
  end

  def self.all(id)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id = '#{id}'")
    result.sort_by { |time| -time['time'].delete(":").to_i }.map { |peep| [peep['text'],
    peep['time']]
    }
  end

  def self.add(text:, user_id:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id,
    time) VALUES ('#{text}', '#{user_id}', '#{time}') RETURNING id, text, user_id, time;")
    Peep.new(id: result[0]['id'], user_id: result[0]['user_id'],
    text: result[0]['text'], time: result[0]['time'])
  end
end
