require 'sinatra/reloader'
require 'sinatra/base'
require 'bcrypt'
require './lib/peep'
require './lib/user'

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peep = peeps_with_users
    erb(:peeps)
  end

  post '/peeps' do
    if invalid_peep_params?
      @error = true
      status 400
    elsif session[:user_id].nil?
      @feedback = :login
      status 401
    else 
      peep = Peep.create(
        content: params[:content],
        user_id: session[:user_id]
      )
      status 201
    end
    @peep = peeps_with_users
    erb(:peeps)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/users' do
    if invalid_sign_up_params?
      @error = true
      status 400
    else
      user = User.create(
        name: params[:name],
        username: params[:username],
        email: params[:email],
        password: params[:password] # BCrypt::Password.create(params[:password])
      )
      status 201
      session[:user_id] = user.id
    end
    @peep = peeps_with_users
    erb(:peeps)
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    user_id = log_in(params[:email], params[:password])
    if !user_id
      @feedback = user_id.nil? ? :no_user : :wrong 
      status 401 
      erb(:login) #use redirect
    else 
      @peep = peeps_with_users
      erb(:peeps)
    end
  end

  post '/logout' do
    session[:user_id] = nil
    @peep = peeps_with_users
    erb(:peeps)
  end

  def peeps_with_users
    Peep.joins(:user).order(created_at: :desc)
  end

  def invalid_peep_params?
    content = params[:content]
    content == nil || html_or_blank?(content)
  end

  def invalid_sign_up_params?
    params.values.any? { |value| value == nil || html_or_blank?(value) }
  end

  def html_or_blank?(content)
    regex = %r{(<[a-z]+>(.|\n)+</[a-z]+>)|(^\s*$)}
    regex.match?(content)
  end
  
  def log_in(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    # encrypted = BCrypt::Password.create(password)
    if user.password == password
      session[:user_id] = user.id
    else
      false
    end
  end
end 
