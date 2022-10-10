class Peep
  def initialize(content = '', creation_date = 0, user_id = 0, username = '')
    @content = content
    @creation_date = creation_date
    @user_id = user_id
    @username = username
  end

  attr_accessor :content, :creation_date, :user_id, :username
end