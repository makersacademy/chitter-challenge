require 'sinatra/base'
require_relative 'lib/users'

class ChitterApp < Sinatra::Base
  use Rack::Session::Pool
  enable :flash

  configure do
    set :users, Users.new
  end
  
  # not_found do
  #   status 404
  #   erb :'404Page'
  # end

  get '/' do
    erb :index
  end

  get '/users/new' do
    p settings.users
    erb :new_user
  end

  post '/users' do

  end

  run! if app_file == $0
end
