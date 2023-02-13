require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'
require_relative 'lib/comment_repository'
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
    comment_repo = CommentRepository.new
    if @user_session
      @user_session_name = user_repo.find(@user_session).name
    end

    posts.each do |post|
      content = post.content
      user = users.select {|user| user.id == post.user_id}

      time_diff = post_repo.time_difference(post.date,post.time,Time.now)

      comments = comment_repo.find_by_post(post.id)

      post_info = {
        post_id:post.id,
        content:post.content,
        date:post.date,
        time:post.time,
        time_diff:time_diff,
        user_id:post.user_id,  
        username:user[0].username,
        name:user[0].name,
        email:user[0].email,
        comments:comments
      }

      @posts_list.unshift(post_info)
    end
    return erb(:index)
  end

  post '/new-post' do
    return 'Please login first' if session[:user_id].nil?
    new_post = Post.new
    new_post.content = params[:content]
    # p Time.now.strftime("%H:%M:%S")
    # p Time.now.to_date.to_s
    new_post.time = Time.now.strftime("%H:%M:%S")
    new_post.date = Time.now.to_date.to_s
    new_post.user_id = session[:user_id]

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
    
    if params[:username].match(/[^a-zA-Z0-9]/)
      @error_message = 'No special characters or space allowed in username.' 
    elsif params[:password].length < 6
      @error_message = 'Password must be at least 6 characters.'
    elsif user_repo.user_exist?(new_user)
      @error_message = user_repo.user_exist?(new_user)
    end


    return erb(:signup) if @error_message

    user_repo.create(new_user)

    # Auto login after sign up
    valid_user_id = user_repo.check_credential(new_user.email,new_user.password)

    session[:user_id] = valid_user_id
    redirect '/'
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
      # return erb(:index)
    else
      @error_message = 'Invalid credential'
      return erb(:login)
    end
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/posts/:id' do
    @user_session = session[:user_id]
    post_repo = PostRepository.new
    @post = post_repo.find(params[:id])
    @post_time_diff = post_repo.time_difference(@post.date,@post.time,Time.now)
    user_repo = UserRepository.new
    @user = user_repo.find(@post.user_id)
    comment_repo = CommentRepository.new
    comments = comment_repo.find_by_post(@post.id)

    @comment_infos = []
    comments.each do |comment|
      user = user_repo.find(comment.user_id)
      comment_time_diff = post_repo.time_difference(comment.date,comment.time,Time.now)
      info = {
        name:user.name,
        username:user.username,
        content:comment.content,
        time_diff:comment_time_diff,
      }
      @comment_infos.unshift(info)
    end

    return erb(:post)
  end

  post '/new-comment/:id' do
    return 'Please login first' if session[:user_id].nil?
    new_comment = Comment.new
    new_comment.content = params[:content]
    new_comment.time = Time.now.strftime("%H:%M:%S")
    new_comment.date = Time.now.to_date.to_s
    new_comment.user_id = session[:user_id]
    new_comment.post_id = params[:id]

    comment_repo = CommentRepository.new
    comment_repo.create(new_comment)
    
    redirect "/posts/#{params[:id]}"
  end
end


