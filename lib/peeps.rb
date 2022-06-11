# ./lib/peeps.rb

class Peeps

  attr_reader :content, :peeper, :id, :post_time

  def initialize(content:, peeper:, id:, post_time:)
    @content = content
    @peeper = peeper
    @id = id
    @post_time = post_time
  end

  def self.create(content, user)
    entry = DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES ($1, $2, current_timestamp)  RETURNING content, peeper, id, post_time",
      [content, user]
    ).first
    Peeps.new(content: entry['content'],
      peeper: entry['peeper'],
      id: entry['id'],
      post_time: entry['post_time']
    )
  end

  def self.show_all
    result = DatabaseConnection.query(
      "SELECT * FROM peeps ORDER BY post_time DESC"
    )
    result.map { |entry| 
      Peeps.new(content: entry['content'],
        peeper: entry['peeper'],
        id: entry['id'],
        post_time: entry['post_time'])
    }
  end

  def self.show_mine
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE peeper = $1 ORDER BY post_time DESC",
      ['DEV_TESTING']
    )
    result.map { |entry| 
      Peeps.new(content: entry['content'],
        peeper: entry['peeper'],
        id: entry['id'],
        post_time: entry['post_time'])
    }
  end

end
