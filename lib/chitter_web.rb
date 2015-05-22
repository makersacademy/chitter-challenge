require 'sinatra/base'

require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/user' # this needs to be done after datamapper is initialised

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
  	erb :'users/new'
  end

  post '/users' do
  	User.create(email: params[:email], password: params[:password])
  	redirect '/'
  end

  run! if app_file == $0
end
