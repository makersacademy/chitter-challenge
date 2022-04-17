require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    session[:user_id] != nil ? @user = User.find(session[:user_id]) : @user = nil
    @peeps = Peep.all
    erb :index
  end

  post '/add_peeps' do
    Peep.create(content: params['content'])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/add_user' do
    user = User.create(username: params['username'], name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/log_in' do
    erb :log_in
  end

  post '/new_session' do
    user = User.authenticate(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
