class Peep
  attr_reader :user, :handle, :message, :created_at
  @@all = []

  def initialize(user:, handle:, message:, created_at:)
    @user = user
    @handle = handle
    @message = message
    @created_at = created_at
    @@all << self
  end

  def self.all #overwriting the class method .all here to initiate a db connection
    connection = db_connect
    
    result = connection.exec "SELECT * FROM peeps"

    result.map do |peep|
      Peep.new(user: peep["user_name"], handle: peep["user_handle"], message: peep["message"], created_at: peep["create_time"])
    end
  end

  def self.create(user, user_handle, message, create_time)
    connection = db_connect
    
    result = connection.exec "INSERT INTO peeps (user_name, user_handle, message, create_time) VALUES('#{user}', '#{user_handle}', '#{message}', '#{create_time}')"

  end

  private

  def self.db_connect
    user = 'arav'
    # password = '123'

    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_manager_test', :user => user

    else
      PG.connect :dbname => 'chitter_manager', :user => user
    end

  end

  def self.db_con_cleanup(rs, con)
    rs.clear if rs
    con.close if con
  end

end