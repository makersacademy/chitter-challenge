require_relative 'database_connection'

class Peep

  attr_reader :uid, :created_at, :msg, :username
  

  def initialize(row)
    @uid =  row['uid'] 
    @created_at = Time.parse(row['created_at'])
    @msg =  row['msg']
    @username = return_user(@uid)
  end

  def self.create(uid:, msg:)
    DatabaseConnection.setup
    DatabaseConnection.query("INSERT INTO peeps (uid, msg) 
                             VALUES ('#{uid}', '#{msg}')"
                            )
  end

  def self.all
    DatabaseConnection.setup
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |row| Peep.new(row) }
  end

  private

  def return_user(uid)
    user = DatabaseConnection.query("SELECT * FROM users WHERE uid = '#{uid}'")
    user.each { |user| return user['username'] }
  end

end 