class Peep
  attr_reader :id, :peep_content, :user_id, :time_of_peep, :username

  def initialize(id:, peep_content:, user_id:, time_of_peep:, username:)
    @id = id
    @peep_content = peep_content
    @user_id = user_id
    @time_of_peep = time_of_peep
    @username = username
  end
end
