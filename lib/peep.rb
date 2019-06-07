require_relative "db_connection"

class Peep
  attr_reader :content, :date

  def self.create(entry, user_id)
      peep_add = DbConnection.query("INSERT INTO peeps (content, user_id) VALUES ('#{entry}', '#{user_id}');")
      # Post.new(number: post_add[0["post_id"], name: post_add[0]["user_name"], content: post_add[0]["content"])

  end

  def self.all
      peeps = DbConnection.query("SELECT content, user_id, date_trunc('minute', date_time_created) formated_time FROM peeps;")
      peeps.map { |peep|
        Peep.new(content: peep["content"], date: peep["formated_time"], user_id: peep["user_id"])
      }
  end

  def initialize(content:, date:, user_id:)
    @content = content
    @date = date
    @user_id = user_id
  end
end
