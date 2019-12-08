require 'sinatra/base'
require_relative 'lib/peep.rb'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  post '/chitter' do
    session[:user_name] = params['name']
    session[:user_handle] = params['user-handle']
    redirect '/chitter/user'
  end

  get '/chitter/user' do
    @peeps = Peep.all
    @user_handle = session[:user_handle]
    @user_name = session[:user_name]
    erb :user
  end

  post '/chitter/user' do
    Peep.create(params['content'])
    redirect '/chitter/user'
  end

  run! if app_file == $0

end
