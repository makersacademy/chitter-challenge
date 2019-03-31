require_relative 'setup_db_connection'
require_relative 'timestamp'
require_relative 'db_manager'

class Cheep
  include Timestamp

  attr_reader :post, :id, :timestamp

  def initialize(post:, id:, timestamp:)
    @post = post
    @id = id
    @timestamp = timestamp
  end

  def self.post(string)
    result = DBManager.query("INSERT INTO posts (post)
                            VALUES ('#{string}')
                            RETURNING id, post, timestamp"
                            )
    cheep_from_db_query(q_result: result[0])
  end

  def self.all
    result = DBManager.query('SELECT * FROM posts')
    result.map { |rec| cheep_from_db_query(q_result:rec) }.reverse
  end

  def self.cheep_from_db_query(q_result:, timestamp_class: Timestamp)
    ts = timestamp_class.db_datetime_format(q_result['timestamp'])
    Cheep.new(post: q_result['post'], id: q_result['id'], timestamp: ts)
  end
end
