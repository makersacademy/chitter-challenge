ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative './data_mapper_setup'
require_relative './models/peep'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], time_stamp: Peep.time)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],)
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
