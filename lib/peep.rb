require 'pg'

class Peep

  def self.all
    DatabaseConnection.query("SELECT * FROM peeps;")
    .map do |peep|
      new(
        content: peep['content'],
        time_stamp: peep['time_stamp'],
        user_id: peep['user_id'].to_i
      )
    end
  end

  def self.create(content:, user_id:)
    DatabaseConnection.query("
      INSERT INTO peeps (content, user_id)
      VALUES('#{content}', #{user_id})
    ")
  end

  def initialize(content:, time_stamp:, user_id:)
    @content = content
    @time_stamp = time_stamp
    @user_id = user_id
  end

  attr_reader :content, :time_stamp, :user_id

end
