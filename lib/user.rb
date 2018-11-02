require_relative 'DatabaseHandler'
class User
=begin
  Variables                     Examples
  @email = user's email         bob@gmail.com
  @password = user's password   Password134
  @name = user's name           Bob
  @username = user's username   @TheBoyBob
  @userid = user's ID           1
=end
  def initialize
    @db = Database.new
  end

  def CreateNewUser(useremail, userpassword, username, userhandle)
    @username = userhandle
    @name = username
    @email = useremail
    @userid = @db.CreateUser(@name, @username, @email, @password)
  end

  def LogIn(useremail)
    @email = useremail
    @username = @db.GetUserHandle(@email)
    @name = @db.GetUserName(@email)
    @userid = @db.GetUserID(@email)
  end

  def change_email(email)
    @email = email
    'email set'
  end

  def change_password(password)
    @password = password
    'password set'
  end

  def change_name(name)
    @name = name
    'name set'
  end

  def change_username(username)
    @username = username
    'username set'
  end

  def change_userid
    @database = Database.new
    @userid = @database.CreateUser(@name, @username, @email, @password)
    'user ID set'
  end

  def view_email
    @email
  end

  def view_password
    @password
  end

  def view_name
    @name
  end

  def view_username
    @username
  end

  def view_userid
    @userid
  end
end
