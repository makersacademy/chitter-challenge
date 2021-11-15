require 'pg'
require_relative 'peep'

class Chitter
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter ORDER BY id DESC")
    result.map do |peep|  
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.create(peep:,time:)
    time = Time.now.strftime("%D/%M/%Y %H:%M")
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec_params(
        "INSERT INTO chitter (peep,time) VALUES('#{peep}','#{time}') RETURNING peep, time ;"
    )
  end

#   def check(username:)
#     result = SELECT username FROM users
#     if result == nil
#     then
#     defined
#     else
#         granted

end
