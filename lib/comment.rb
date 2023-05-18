class Comment
  attr_accessor :id, :comment_content, :user_id, :peep_id, :time_of_comment

  def initialize(id:, comment_content:, user_id:, peep_id:, time_of_comment:)
    @id = id
    @comment_content = comment_content
    @user_id = user_id
    @peep_id = peep_id
    @time_of_comment = time_of_comment
  end
end
