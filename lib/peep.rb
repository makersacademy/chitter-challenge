require 'pg'

class Peep

  attr_reader :content, :time_stamp, :handle
  def initialize(content:, time_stamp:, handle:)
    @content = content
    @time_stamp = time_stamp
    @handle = handle
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT content, time_stamp, handle FROM chitter_peeps JOIN chitter_users ON chitter_peeps.user_id=chitter_users.user_id ORDER BY time_stamp DESC ;")
    result.map do |peep|
      Peep.new(content: peep['content'], time_stamp: peep['time_stamp'] ,handle: peep['handle'])
    end
  end

  def self.create(content:,time_stamp:,user_id:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO chitter_peeps (content, time_stamp, user_id) VALUES('#{content}', '#{time_stamp}', '#{user_id}') RETURNING content, time_stamp, user_id;")
  end
end
