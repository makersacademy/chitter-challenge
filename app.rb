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
    session[:unique_email] = User.unique_email?(params[:email])

    unless session[:unique_email] && User.unique_username?(params[:username])
      redirect '/users/signup/fail'
    end

    user = User.sign_up(email: params[:email], password: params[:password],
                        name: params[:name], username: params[:username])

    session[:userid] = user.id
    session[:name] = user.name

    redirect '/peeps'
  end

  get '/users/signup/fail' do
    session[:unique_email] ? @fail = 'Username in use' : @fail = 'Email in use'
    erb(:'users/signup_fail')
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

  run! if app_file == $0
end
