require_relative "db_connection"

class Peep
  attr_reader :content, :date

  def self.create(entry)
      peep_add = DbConnection.query("INSERT INTO peeps (content) VALUES ('#{entry}');")
      # Post.new(number: post_add[0["post_id"], name: post_add[0]["user_name"], content: post_add[0]["content"])

  end

  def self.all
      peeps = DbConnection.query("SELECT content, date_trunc('minute', date_time_created) formated_time FROM peeps;")
      peeps.map { |peep|
        Peep.new(content: peep["content"], date: peep["formated_time"])
      }
  end

  def initialize(content:, date:)
    @content = content
    @date = date
  end
end
