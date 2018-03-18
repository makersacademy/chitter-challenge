class Account

  attr_reader :id, :username, :password, :email

  def initialize(id, username, password, email)
    @id = id
    @username = username
    @password = password
    @email = email
  end

  def self.all
    res = DatabaseConnection.query('SELECT * FROM accounts ORDER BY id ASC')
    res.map { |account| Account.new(account['id'],account['username'],account['password'],account['email'])}
  end

  def self.sign_up(username,password,email)
    return 'invalid username' if username_taken?(username)
    return 'invalid email' if email_taken?(email)
    DatabaseConnection.query("INSERT INTO accounts (username,password,email) VALUES ('#{username}','#{password}','#{email}')")
  end

  def self.login(username,password)
    login_account = nil
    all.each do |account|
      if account.username == username
        login_account = account
      end
    end
    if login_account == nil
      return false
    end
    if login_account.password == password
      @current_user = login_account
    else
      return false
    end
  end

  def self.logout
    @current_user = nil
  end

  def self.current_user
    @current_user
  end

  def self.username_taken?(username)
    all.each do |account|
      if account.username == username
        return true
      end
    end
    return false
  end

  def self.email_taken?(email)
    all.each do |account|
      if account.email == email
        return true
      end
    end
    return false
  end

end
