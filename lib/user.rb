class User
  attr_reader :user_handle, :user_name, :user_email, :logged_in

  def initialize(handle, password)
    ENV['ENVIRONMENT'] == 'test' ? (connection = PG.connect(dbname: 'chitterdb_test')) : (connection = PG.connect(dbname: 'chitterdb'))
    
    result = connection.exec("SELECT * FROM users WHERE user_handle = '#{handle}';")
    @user_details = result.map { |person|
    { user_handle: person['user_handle'], user_name: person['user_name'], user_email: person['user_email'], user_password: person['user_password'] } }
    @user_details.each do |user|
      @user_handle = user[:user_handle]
      @user_name = user[:user_name]
      @user_email = user[:user_email]
      @user_password = user[:user_password]
    end
    
    @user_password == password ? (@logged_in = true) : (@logged_in = false)
  end

  def handle(handle = @user_handle)
    @user_handle = handle
  end

  def name(name = @user_name)
    @user_name = name
  end

  def email(email = @user_email)
    @user_email = email
  end

  def log_in(logged_in = @logged_in)
    @logged_in = logged_in
  end

  def log_out(logged_in = @logged_in)
    @logged_in = false
  end

  def self.create(user_handle, user_password)
    @user = User.new(user_handle, user_password)
  end

  def self.instance
    @user
  end

end
