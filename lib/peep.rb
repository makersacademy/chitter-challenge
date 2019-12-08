require './lib/database_connection'

class Peep
attr_reader :text, :user_id, :id
  def initialize(id:, text:, user_id:)
    @text = text
    @user_id = user_id
    @id = id
  end

  def self.all(id)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id = '#{id}'")
    result.map { |peep| peep['text']}
  end

  def self.add(text:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id) VALUES ('#{text}', '#{user_id}') RETURNING id, text, user_id;")
    Peep.new(id: result[0]['id'], user_id: result[0]['user_id'], text: result[0]['text'])
  end
end
