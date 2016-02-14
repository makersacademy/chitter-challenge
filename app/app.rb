ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'


require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'helpers/current_user'

class Chitter < Sinatra::Base
  helpers Helpers
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    if session[:user_id]
      redirect to '/peeps'
    else
      redirect '/users/new'
    end
  end

  get '/peeps' do
    @peep = Peep.all(:order => [ :time.desc ])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      redirect '/users/new'
    end
  end

  post '/peeps' do
    Peep.create(user: current_user,
                content: params[:content],
                time: Time.now)
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name], username: params[:username])
    if @user.valid?
      session[:user_id] = @user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/peeps/new'
    else
      flash.now[:errors] = ["Email or Password are incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/peeps'
  end

  post '/response' do
    peep = Peep.get(params[:current_peep])
    reply = Response.create(user: current_user, content: params[:content], peep: peep, time: Time.now)
    peep.responses << reply
    peep.save
    redirect to '/'
  end


  run! if app_file == $0

end
