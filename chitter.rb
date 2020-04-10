require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/maker'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    maker = Maker.create(params['name'], params['username'], params['email'], params['password'])
    session[:maker_id] = maker.id
    redirect '/peeps'
  end

  get '/peeps' do
    @maker = Maker.find(session[:maker_id]) unless session[:maker_id].nil?
    @peeps = Peep.all
    erb :"peeps/peeps"
  end

  post '/peeps' do
    Peep.create(params['peep'], Time.now)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  run! if app_file == $0
end
