class Peep
  attr_reader :id, :peep_content, :time_of_peep, :user_id

  def initialize(id:, peep_content:, time_of_peep:, user_id:)
    @id = id
    @peep_content = peep_content
    @time_of_peep = time_of_peep
    @user_id = user_id
  end
end


