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
    @user = User.all
    @peep = Peep.all
    erb :home
  end

  get '/addpeep' do
    erb :addpeep
  end

  post '/addpeep' do
    Peep.add(params[:peep_text])
    redirect '/home'
  end

  get '/deletepeep' do
    @peep = Peep.all
    erb :deletepeep
  end

  post '/deletepeep' do
    Peep.delete(params[:id])
    redirect '/home'
  end

  get '/editpeep' do
    @peep = Peep.all
    erb :editpeep
  end

  post '/editpeep' do
    p params
    Peep.edit(params[:id],params[:peep_text])
    redirect '/home'
  end

  run! if app_file == $0
end