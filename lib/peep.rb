class Peep
  attr_reader :id, :message, :user_id, :created_at

  def initialize(id:, message:, user_id:, created_at:)
    @id = id
    @message = message 
    @user_id = user_id
    @created_at = created_at
  end
end
