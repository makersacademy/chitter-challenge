require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'
require_relative './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/peeps' do
    @peeps = Peep.all
    @logged_in = !session[:userid].nil?
    @name = session[:name]
    erb(:'peeps/index')
  end

  get '/peeps/post' do
    erb(:'peeps/post')
  end

  post '/peeps' do
    Peep.post(text: params[:text], userid: session[:userid])
    redirect '/peeps'
  end

  get '/users/signup' do
    erb(:'users/signup')
  end

  post '/users' do
    if !User.unique_email?(params[:email])
      flash[:notice] = 'Email in use'
      redirect '/users/signup'
    elsif !User.unique_username?(params[:username])
      flash[:notice] = 'Username in use'
      redirect '/users/signup'
    end

    user = User.sign_up(email: params[:email], password: params[:password],
                        name: params[:name], username: params[:username])

    session[:userid] = user.id
    session[:name] = user.name

    redirect '/peeps'
  end

  get '/login/new' do
    erb(:'users/login')
  end

  post '/login' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:userid] = user.id
      session[:name] = user.name
      redirect '/peeps'
    else
      flash[:notice] = 'Your email or password is incorrect'
      redirect '/login/new'
    end
  end

  post '/logout' do
    session.clear
    flash[:notice] = 'You have logged out'
    redirect '/peeps'
  end

  run! if app_file == $0
end
