require 'pg'
require 'time'

class Peeps

  def self.all
    peeps = sql('
                      SELECT p.id, user_id, message, time, name, username
                      FROM peeps p
                      left join users u
                      on u.id = user_id
                      order by time desc;')
    peeps.map { |peep| {
                        id: peep['id'],
                        user_id: peep['user_id'],
                        message: peep['message'],
                        time: Time.parse(peep['time']),
                        name: peep['name'],
                        username: peep['username']
                        }
                  }
  end

  def self.create(user_id, peep_content, replying_to="NULL")
    sql("insert into peeps(user_id, message, replying_to_id)
          values (#{user_id}, '#{peep_content}', #{replying_to});")
  end


  private

  def self.sql(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return connection.exec(query)
  end

end
