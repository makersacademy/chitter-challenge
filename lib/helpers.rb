def logged_in?
    !!session[:user_id]
  end
  
  def current_user
    UserRepository.new.find_by_id(session[:user_id])
  end
  
  def process_peep
    peep = Peep.new
    peep.content = params[:content]
    peep.timestamp = Time.now
    peep.user_id = session[:user_id]
    peep
  end
  
  def process_signup_details
    begin
      user = User.new
      user.username = params[:username]
      user.email = params[:email]
      user.password = params[:password]
      repo = UserRepository.new
      repo.signup(user)
      repo.find_by_username(user.username)
    rescue PG::UniqueViolation
      redirect '/signup'
    end
  end
  
  def process_signin_details(username, password)
    begin
      repo = UserRepository.new
      repo.check_valid_user(username, password)
    rescue IndexError
      redirect '/signin'
    end
  end
  
  def extract_tagged_users(content)
    tagged_users = []
    words = content.split
    users = UserRepository.new.all
    users.each do |user|
      if words.include?("@#{user.username}")
        tagged_users << user.username
      end
    end
    tagged_users
  end