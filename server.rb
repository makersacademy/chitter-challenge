require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'tilt/erb'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_chatter_#{env}")
require './lib/user'
require './lib/peep'
DataMapper.finalize
DataMapper.auto_upgrade!

class ChitterChatter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride
  use Rack::Flash, sweep: true

  get '/' do
    puts "*" * 20 + 'get /'
    puts Peep.all.inspect
    @peeps = Peep.all
    erb :homepage
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @username = params[:username]
    @password = params[:password]
    @user = User.new(username: params[:username],
                     real_name: params[:real_name],
                     email: params[:email],
                     password: params[:password])
    if User.all(username: @username).count == 0
      @user.save
      session[:username] = @username
      erb :homepage
    else
      flash[:notice] = 'Sorry, that username is already taken.'
      erb :'users/new'
    end
  end

  post '/peeps/new' do
    Peep.create(peep_content: params[:peep_content])
    flash[:notice] = 'Peep has been posted!'
    puts "*" * 20 + 'peeps/new'
    puts Peep.all
    redirect('/')
  end

  post '/sessions' do
    @username = params[:username]
    @password = params[:password]
    user = User.authenticate(@username, @password)
    if user
      session[:username] = @username
      erb :homepage
    else
      erb :homepage
    end
  end

  delete '/sessions' do
    session[:username] = nil
    erb :homepage
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:username]) if session[:username]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == ChitterChatter

end
