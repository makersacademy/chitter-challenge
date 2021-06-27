require_relative 'database_connection'

class Peep
  attr_reader :peep_id, :peep_text, :peeped_on, :user_id

  def initialize(peep_id:, peep_text:, peeped_on:, user_id:)
    @peep_id = peep_id
    @peep_text = peep_text
    @peeped_on = peeped_on
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY peep_id DESC;")
    result.map do |peep| 
      Peep.new(
        peep_id: peep['peep_id'], 
        peep_text: peep['peep_text'], 
        peeped_on: peep['peeped_on'],
        user_id: peep['user_id']
      )
    end
  end

  def self.create(peep_text:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep_text, user_id) VALUES('#{peep_text}', #{user_id}) RETURNING peep_id, peep_text, peeped_on, user_id;")
    Peep.new(
      peep_id: result[0]['peep_id'], 
      peep_text: result[0]['peep_text'], 
      peeped_on: result[0]['peeped_on'],
      user_id: result[0]['user_id']
    )
  end

  def self.who(user_id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id=#{user_id};")
    result.map do |peep|
      Peep.new(
        peep_id: peep['peep_id'],
        peep_text: peep['peep_text'],
        peeped_on: peep['peeped_on'],
        user_id: peep['user_id']
      )
    end
  end
end
