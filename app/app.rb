ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  post '/peeps' do
    time = Time.new
    Peep.create(:peeps => params[:peeps], time: "#{time.hour}:#{time.min}")
    redirect('/peeps')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
              password: params[:password],
              name: params[:name],
              surname: params[:surname],
              username: params[:username])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
