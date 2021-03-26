require './lib/db_connection'
require './lib/peep'

class Chitter
  
  def self.send_peep(message, user_id)
    DbConnection.query("INSERT INTO peeps(message, user_id) VALUES ('#{message}', '#{user_id}');")
  end

  def self.all_peeps
    @peeps = []
    DbConnection.query("SELECT * FROM peeps ORDER BY created_at ASC;").each do |peep|
      @peeps << Peep.new(id: peep['id'], message: peep['message'], user_id: peep['user_id'], 
created_at: peep['created_at'])
    end
    return @peeps
  end

  
end
