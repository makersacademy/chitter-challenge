class Peep
  attr_reader :user, :handle, :message
  @@all = []

  def initialize(user:, handle:, message:)
    @user = user
    @handle = handle
    @message = message
    @@all << self
  end

  def self.all #overwriting the class method .all here to initiate a db connection
    connection = db_connect
    
    result = connection.exec "SELECT * FROM peeps"

    result.map do |peep|
      Peep.new(user: peep["user_name"], handle: peep["user_handle"], message: peep["message"])
    end
  end

  def self.create(user, user_handle, message)
    connection = db_connect
    
    result = connection.exec "INSERT INTO peeps (user_name, user_handle, message) VALUES('#{user}', '#{user_handle}', '#{message}')"
    

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