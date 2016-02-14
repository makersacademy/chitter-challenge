ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peep = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(name: params[:name], username: params[:username],
                    content: params[:content])
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name], username: params[:username])
    if user.valid?
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      redirect to '/users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
