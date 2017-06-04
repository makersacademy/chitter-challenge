ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps/all' do
    @peeps = Peep.all
    erb(:'peeps/all')
  end

  post '/peeps/new' do
    peep = Peep.create(content: params[:new_peep])
    redirect('/peeps/all')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  get 'users/new' do
    erb(:'users/new')
  end

  post 'users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/users/new')
  end

end
