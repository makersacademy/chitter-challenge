class Peep
  attr_accessor :id, :peep_content, :time_of_peep, :user_id, :user

  def initialize(id:, peep_content:, time_of_peep:, user_id:, user: nil)
    @id = id
    @peep_content = peep_content
    @time_of_peep = time_of_peep
    @user_id = user_id
    @user = user
  end
end

