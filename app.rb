require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  post '/add_peeps' do
    user = User.find(session[:user_id])
    Peep.create(content: params['content'], username: user.username, name: user.name)
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    result = User.check_usernames_and_emails(username: params['username'], email: params['email'])
    if result == true
      redirect '/sign_up_failure'
    else
      user = User.create(username: params['username'], name: params['name'], 
                         email: params['email'], password: params['password'])
      session[:user_id] = user.id
      redirect '/'
    end
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user.nil?
      redirect '/log_in_failure'
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end

  post '/log_out' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/log_in_failure' do
    erb :log_in_failure
  end

  get '/sign_up_failure' do
    erb :sign_up_failure
  end

  run! if app_file == $0
end
