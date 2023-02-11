require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'
require_relative 'lib/post'
require_relative 'lib/user'
require 'date'

DatabaseConnection.connect

class Application < Sinatra::Base  
  enable :sessions 
  use Rack::Session::Cookie, :expire_after => 3600, :secret => 'secret_key'
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/post_repository'
  end

  get '/' do
    @user_session = session[:user_id]
    @posts_list = []
    post_repo = PostRepository.new
    posts = post_repo.all
    user_repo = UserRepository.new
    users = user_repo.all
    if @user_session
      @user_session_name = user_repo.find(@user_session).name
    end

    posts.each do |post|
      content = post.content
      user = users.select {|user| user.id == post.user_id}

      time_diff = post_repo.time_difference(post.date,post.time,Time.now)

      post_info = {
        content:post.content,
        date:post.date,
        time:post.time,
        time_diff:time_diff,
        user_id:post.user_id, 
        username:user[0].username,
        name:user[0].name,
        email:user[0].email,
      }

      @posts_list.unshift(post_info)
    end
    return erb(:index)
  end

  post '/new-post' do
    new_post = Post.new
    new_post.content = params[:content]
    # p Time.now.strftime("%H:%M:%S")
    # p Time.now.to_date.to_s
    new_post.time = Time.now.strftime("%H:%M:%S")
    new_post.date = Time.now.to_date.to_s
    new_post.user_id = 3

    post_repo = PostRepository.new
    post_repo.create(new_post)

    redirect '/'
  end

  get '/sign-up' do
    return erb(:signup)
  end

  post '/new-user' do
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]
    new_user.username = params[:username]
    new_user.name = params[:name]

    user_repo = UserRepository.new
    @error_message = user_repo.user_exist?(new_user)
    # return user_check if user_check
    if @error_message
      return erb(:signup)
    end


    user_repo.create(new_user)

    return 'Successfully created!'
  end

  get '/login' do
    return erb(:login)
  end

  post '/user-login' do
    email = params[:email] 
    password = params[:password]
    user_repo = UserRepository.new
    valid_user_id = user_repo.check_credential(email,password)

    if valid_user_id
      session[:user_id] = valid_user_id
      redirect '/'
      # return 'Successfully login'
    else
      return 'Invalid credential'
    end
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end
end


