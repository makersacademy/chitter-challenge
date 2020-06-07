require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/peep'
require_relative './lib/feed'
require_relative 'connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/chitter/account/new' do
    erb :'account/new'
  end

  post '/chitter/account/new' do
    #flash[:username] = 'Your username is not unique' unless User.unique?('username', params[:username])
    if User.unique?('username', params[:username])
      user = User.create(params[:username], params[:email], params[:password], params[:full_name])
      session[:user_id] = user.id
      redirect "/chitter/account/#{params[:username]}"
    else
      flash[:notice] = 'Your username is not unique'
      redirect "/chitter/account/new"
    end
  end

  get '/chitter/account/:username' do
    @user = User.find(session[:user_id])
    @feed = Feed.all
    erb :'account/feed'
  end

  post '/chitter/account/:username/post_peep' do
    peep = Peep.create(params[:peep_body])
    user = User.find(session[:user_id])
    Feed.add(user, peep)
    redirect "/chitter/account/#{params[:username]}"
  end

  run! if app_file == $0
end
