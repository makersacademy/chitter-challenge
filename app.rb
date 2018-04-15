require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/database_connection'
require './lib/peep.rb'
require './lib/user.rb'


class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    erb :"peeps/index"
  end

  get '/peeps/new' do

  end

  post '/peeps/new' do

    redirect ('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(params)
    session[:user_id] = user.id
    redirect ('/')
  end

end
