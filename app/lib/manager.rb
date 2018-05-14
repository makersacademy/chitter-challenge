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
    current_user = get_all_users.select {|object| object.handle == user }
    DatabaseQueryManager.add_peep(current_user[0].id, message)
  end

  # def self.check_user(user)
  #   p user
  #   p 'HI'
  #   p Manager.get_all_users
  #   current_user = get_all_users.select {|object| p object }
  #   current_user
  # end

end
