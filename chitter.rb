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
    @maker = Maker.find_by_id(session[:maker_id]) unless session[:maker_id].nil?
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

  get '/sessions/destroy' do
    session[:maker_id] = nil
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions/new' do
    if Maker.valid_credentials?(params['username'], params['password'])
      maker = Maker.find_by_username(params['username'])
      session[:maker_id] = maker.id
      redirect '/peeps'
    end
  end

  run! if app_file == $0
end
