require './lib/db_connection'
require './lib/peep'
require './lib/user'

class Chitter
  
  def self.all_peeps
    @peeps = []
    DbConnection.query("SELECT * FROM peeps ORDER BY created_at DESC;").each do |peep|
      @peeps << Peep.new(peep_id: peep['peep_id'], message: peep['message'], 
                         user_id: peep['user_id'], created_at: peep['created_at'])
    end
    return @peeps
  end

  def self.all_users
    @users = []
    DbConnection.query("SELECT * FROM users;").each do |user|
      @users << User.new(user_id: user['user_id'], username: user['username'], 
                         email: user['email'])
    end
    return @users
  end
end
