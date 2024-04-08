class PeepUser
  attr_accessor :id, :peep_id, :user_id

  def initialize(id, peep_id, user_id)
    @id = id
    @peep_id = peep_id
    @user_id = user_id
  end
end