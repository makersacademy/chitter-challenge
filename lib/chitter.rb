require './lib/db_connection'
require './lib/peep'
require './lib/user'
require './lib/tag'

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

  def self.all_tags
    @tags = []
    DbConnection.query("SELECT * FROM tags;").each do |tag|
      @tags << Tag.new(tag_id: tag['tag_id'], user_id: tag['user_id'], 
                         peep_id: tag['peep_id'])
    end
    return @tags
  end
end
