require 'pg'

class Peep
  attr_reader :id, :content, :posted_at, :user_id

  def initialize(id, content, posted_at, user_id)
    @id = id
    @content = content
    @posted_at = posted_at
    @user_id = user_id
  end

  def find_user(user_id)
    set_database
    result = @con.exec("SELECT username FROM users WHERE id = #{user_id}")
    result[0]['username']
  end

  def set_database
  @con = if ENV['ENVIRONMENT'] == 'test'
          PG.connect(dbname: 'chitter_test')
         else
          PG.connect(dbname: 'chitter')
         end
  end
end