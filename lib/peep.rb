class Peep

  def self.new_peep(message, user_id)
    new_peep = DbConnection.query("INSERT INTO peeps(message, user_id) VALUES ('#{message}',
                                  '#{user_id}') RETURNING peep_id, message, user_id, created_at;")
    Peep.new(peep_id: new_peep[0]['peep_id'], message: new_peep[0]['message'],
                                   user_id: new_peep[0]['user_id'], 
                                   created_at: new_peep[0]['created_at'])
  end

  attr_reader :peep_id, :message, :user_id, :created_at

  def initialize(peep_id:, message:, user_id:, created_at:)
    @peep_id = peep_id
    @message = message 
    @user_id = user_id
    @created_at = created_at
  end
end
