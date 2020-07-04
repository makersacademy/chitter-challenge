require 'sinatra/base'
require 'pg'
require './lib/user.rb'

class Chitter < Sinatra::Base

  get '/' do
    @loginagain = $loginagain
   erb :index
  end

  post '/' do
    redirect '/home' if User.check(params["email"],params["password"]) == true
    $loginagain = true
    redirect '/'
  end

  get '/home' do
    erb :home
  end

  run! if app_file == $0
end