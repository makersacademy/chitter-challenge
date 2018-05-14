require_relative 'database_query_manager'
require_relative 'peep'
require_relative 'users'

class Manager

  @peep_class = Peep
  @user_class = Users

  def self.get_all_posts
    DatabaseQueryManager.all_peeps.map{ |row| @peep_class.new(row['id'], row['user_id'], row['peep'], row['timestamp']) }
  end

  def self.get_all_users
    DatabaseQueryManager.all_users.map{ |row| @user_class.new(row['id'], row['email'], row['name'], row['handle'], row['password'])}
  end

  def self.add_peep(user, message)
    DatabaseQueryManager.add_peep(check_user(user)[0].id, message)
  end

  private

  def self.check_user(user)
    current_user = get_current_user(user)
    current_user.empty? ? get_current_user('Anonymous') : current_user
  end

  def self.get_current_user(user)
    get_all_users.select {|object| object.handle == user }
  end

end
