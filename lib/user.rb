class User

  attr_reader :username, :email, :password

  def self.construct(user)
    @username = user.username
    @email = user.email
    @password = user.password
  end


  def self.get_user(username)
    @results = DBhelper.check_user(username)
    user_arr = []

    p @results
    @results.each do |user|

      username = user['username']
      email = user['email']
      password = user['password']
      
      users = CurrentUser.new(username,email,password)
      user_arr << users
      #user = CurrentUser.new(@user[0]['username'], @user[0]['email'], @user[0]['password'])
    end
    return user_arr
  end

  class CurrentUser
    attr_reader :username, :email, :password

    def initialize(username, email, password)
      @username = username
      @email = email
      @password = password
    end
  end
end