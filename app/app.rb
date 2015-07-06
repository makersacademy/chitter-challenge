require 'sinatra/base'
require 'sinatra/flash'
# require 'factory_girl'
# require './app/models/user'
# require './app/models/peep'

require 'data_mapper'
require_relative 'data_mapper_setup'

class Chitterchallenge < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :sessions_secret, 'super secret'
  set :views, proc { File.join(root, '..', 'views') }

get '/' do
    redirect '/peeps'
end

get '/peeps' do
    @peeps = Peep.all(:order => :time_date.desc)
    erb :'peeps/index'
  end

  post '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    if current_user
      peep = Peep.new(message: params[:peep],
                  username: current_user.username, name: current_user.name)
      peep.save
      redirect '/peeps'
    else
      flash[:notice]='Please sign in first'
      redirect '/signin/sign_in'
    end
  end

get '/users/new' do 
  erb :'users/new'
end
post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

get '/signin/sign_in' do
    erb :'signin/sign_in'
  end

  post '/signin' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['Incorrect username and/or password']
      redirect to('/signin/sign_in')
    end
  end

  delete '/users' do
    flash[:notice] = 'Goodbye!'
    session[:user_id] = nil
    redirect '/'
  end


  helpers do
    def current_user
      @user||=User.get session[:user_id]
    end
  end
end

