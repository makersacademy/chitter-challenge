class Peep
  attr_reader :id, :peep_content, :user_id, :time_of_peep, :username, :comments

  def initialize(id:, peep_content:, user_id:, time_of_peep:, username:, comments: [])
    @id = id
    @peep_content = peep_content
    @user_id = user_id
    @time_of_peep = time_of_peep
    @username = username
    @comments = comments
  end

  def peep_content=(content)
    @peep_content = content
  end

end
