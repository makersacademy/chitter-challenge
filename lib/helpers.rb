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

def construct_peep
  peep = Peep.new
  peep.content = params[:content]
  peep.timestamp = Time.now
  peep.user_id = session[:user_id]
  peep
end

def logged_in?
  !!session[:user_id]
end

def current_user
  UserRepository.new.find_by_id(session[:user_id])
end

def process_user_details
  user = User.new
  user.username = params[:username]
  user.email = params[:email]
  user.password = params[:password]
  user
end
