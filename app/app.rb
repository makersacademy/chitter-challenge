require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc{File.join(root, '..' , 'views')}

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to('/peeps')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
end
