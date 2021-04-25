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
    # insert new peep to DB
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO chitter_peeps (content, time_stamp, user_id) VALUES('#{content}', '#{time_stamp}', '#{user_id}') RETURNING content, time_stamp, user_id;")

  end
end



#
# | peep_id |  content          | time_stamp            | user_id |
# |---------|-------------------|-----------------------|--------------------|
# | 1       | 'hi @billy123'    |  2021-04-25 20:26:10  | 2                  |
# | 2       |	'hi @knock_knock' |  2021-04-25 20:27:00  | 1                  |
# | 3       | 'who's there?'    |  2021-04-25 20:32:24  | 2                  |
# | 4       |	'uh..'            |  2021-04-25 20:42:44  | 1                  |
