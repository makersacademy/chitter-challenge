require 'mail'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/user'
require_relative 'lib/post'

class ChitterApplication < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    register Sinatra::ActiveRecordExtension
  end

  before do   
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  get '/' do
    @posts = Post.includes(:children, :user)
             .joins(:user)
             .order(created_at: :desc)
             .order("children_posts.created_at": :asc)
             .all
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    username, plaintext_password = params[:username], params[:password]
    user = User.find_by(username: username)
    return redirect('/login') if dodgy?(username) || dodgy?(plaintext_password) || user == nil
    if BCrypt::Password.new(user.password_digest) == plaintext_password
      session[:user_id] = user.id
      return redirect('/')
    else
      return redirect('/login')
    end
  end

  get '/create_post' do
    ask_for_login
    erb :create_post
  end

  post '/create_post' do
    ask_for_login
    create_post(current_time=params[:created_at])
    return redirect('/')
  end

  get '/reply/:id' do
    ask_for_login
    @original_post = Post.joins(:user).find(params[:id])
    erb :create_reply
  end

  post '/reply/:id' do
    ask_for_login
    create_post(params[:id])
    return redirect('/')
  end
    
  get '/register' do
    erb :register
  end

  post '/register' do
    username, password, email, real_name = params[:username], params[:password], params[:email], params[:real_name]
    to_validate = [username, password, email, real_name]
    to_validate.each {|form_data| return redirect('/register') if dodgy?(form_data)}
    return redirect('/register') if !!User.find_by(username: username) || !!User.find_by(email: email)
    new_user = User.new
    encrypted_password = BCrypt::Password.create(password)
    new_user.username, new_user.password, new_user.email, new_user.real_name = username, encrypted_password, email, real_name
    new_user.save
    session[:user_id] = new_user.id
    return redirect('/')
  end

  get '/logout' do
    session.clear
    return redirect('/')
  end
  
#### --- Helper Methods --- ####

  def ask_for_login
    return redirect('/login') unless @current_user
  end

  def dodgy?(input)
    return input.match?(/<|>/) || input.match?(/^\s*$/)
  end

  def create_post(parent_id=nil)
    post = Post.new
    post.user_id, post.content, post.parent_id = @current_user.id, params[:content], parent_id
    post.save
    scan_and_notify_users_if_tagged(post)
  end

  def scan_and_notify_users_if_tagged(post)
    tags = post.content.scan(/@(\w+)/)
    tags.each do |username_to_notify|
      user_to_notify = User.where(username: username_to_notify).first
      if user_to_notify
        send_email(post.user.email, user_to_notify.email, user_to_notify.real_name, post.content, mail_environment="test")
      end
    end
  end

  def send_email(from_address, to_address, real_name, content, mail_environment=nil)
    mail = Mail.new do
      from     from_address
      to       to_address
      subject  'You have been tagged in Chitter'
      body     "#{real_name.capitalize}, you have been tagged in a post in Chitter!\n\n'#{content}'\n"
    end
    mail.delivery_method :logger if mail_environment
    mail.deliver
  end
  
end