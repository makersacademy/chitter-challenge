require 'sinatra/base'
require 'pg'
require './lib/user.rb'
require './lib/peep.rb'

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
    @user = User.access
    @peep = Peep.all
    erb :home
  end

  get '/addpeep' do
    erb :addpeep
  end

  post '/addpeep' do
    peep = params[:peep_text]
    Peep.add(peep)
    redirect '/home'
  end

  run! if app_file == $0
end