require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'
require_relative './lib/database_connection_setup.rb'
require 'date'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :'chitter/index'
  end

  post '/chitter' do
    @peep = Peep.create(content: params[:content], time_created: Time.now.to_s)
    redirect '/chitter'
  end

  get '/chitter/user/new' do
    erb :'chitter/user/new'
  end

  post '/chitter/user/new' do
    user = User.create(
      firstname: params[:firstname], lastname: params[:lasttname], email: params[:email], handle: params[:handle], password: params[:password]
    )
    session[:user_id] = user.id
    redirect '/chitter'
  end

    run! if app_file == $0
end