class Peep
  attr_accessor :content, :time_of_posting, :user_id

  def initialize(content, time_of_posting, user_id)
    @content = content
    @time_of_posting = time_of_posting
    @user_id = user_id
  end
end
