class User

  def self.login(username, password)
    user = Database_Connection.querry("SELECT * FROM users WHERE username = '#{username}';")
    if user.ntuples == 0 then return "error::no_user" else user = user[0] end
    if user['password'] == password
      @user = username
    else
      @user = 'error::password'
    end
  end

  def self.username
    if @user.nil?
      nil
    else
      Database_Connection.querry("SELECT username FROM users WHERE username = '#{@user}'")[0]['username']
    end
  end

  def self.email
    reutrn nil if @user.nil?
    Database_Connection.querry("SELECT email FROM users WHERE username = '#{@user}'")[0]['email']
  end

  def self.fname
    reutrn nil if @user.nil?
    Database_Connection.querry("SELECT fname FROM users WHERE username ='#{@user}'")[0]['fname']
  end

  def self.sname
    reutrn nil if @user.nil?
    Database_Connection.querry("SELECT sname FROM users WHERE username ='#{@user}'")[0]['sname']
  end



  def initialize(username, password, email, fname, sname)
    Database_Connection.querry("INSERT INTO users VALUES(DEFAULT, '#{username}', '#{password}', '#{email}', '#{fname}', '#{sname}')")
  end
end
