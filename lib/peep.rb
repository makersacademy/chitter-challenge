require 'pg'
class Peep
  attr_reader :id, :message, :time_posted, :posted_by

  def self.connection_helper
    if ENV['CHITTER_ENVIRON'] == 'test'
      dbname = 'chitter_test'
    else
      dbname = 'chitter'
    end
    @conn = PG.connect(dbname: dbname)
  end

  def self.create(message:, posted_by: 1)
    connection_helper
    result = @conn.exec("INSERT INTO peep (message, posted_by)
                        values('#{message}', 1) RETURNING id,
                        message, time_posted, #{posted_by};").first
    Peep.new(id: (result['id']).to_i, message: result['message'],
                  time_posted: result['time_posted'],
                  posted_by: (result['posted_by']).to_i)
  end

  def self.all
    connection_helper
    result = @conn.exec("SELECT * FROM peep order by time_posted desc;")
    result.map do |result_row|
      Peep.new(id: (result_row['id']).to_i, message: result_row['message'],
                time_posted: result_row['time_posted'],
                posted_by: (result_row['posted_by']).to_i)
    end
  end

  def initialize(id:, message:, time_posted:, posted_by:)
    @id = id
    @message = message
    @time_posted = time_posted
    @posted_by = posted_by
  end

end
