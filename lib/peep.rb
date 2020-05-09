class Peep

  attr_reader :id, :user_name, :real_name, :time_stamp, :body

  def initialize(id, user_name, real_name, time_stamp, body)
    @id = id
    @user_name = user_name
    @real_name = real_name
    @time_stamp = time_stamp
    @body = body
  end
end
