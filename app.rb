require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/user'
require_relative 'lib/post'
require_relative 'lib/reply'


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
    @posts = Post.joins(:user).select(:content, :created_at, :'users.username').order(created_at: :desc)
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    username, plaintext_password = params[:username], params[:password]
    user = User.find_by(username: username)
    return redirect('/login') if is_dodgy?(username) || is_dodgy?(plaintext_password) || user == nil
    if BCrypt::Password.new(user.password_digest) == plaintext_password
      session[:user_id] = user.id
      return redirect('/')
    else
      return redirect('/login')
    end
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    username, password, email, real_name = params[:username], params[:password], params[:email], params[:real_name]
    to_validate = [username, password, email, real_name]
    to_validate.each {|form_data| return redirect('/register') if is_dodgy?(form_data)}
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
  
  def is_dodgy?(input)
    return input.match?(/<|>/) || input.match?(/^\s*$/)
  end

end