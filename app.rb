require 'sinatra/base'
require 'sinatra/flash'
# require './lib/peep'
require './lib/user'
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users/new' do
    User.add(params['username'], params['name'], params['email'], params['password'])
    redirect '/'
  end

  run! if app_file == $0
end
