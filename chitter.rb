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

  post '/users/new' do
    maker = Maker.create(params['name'], params['username'], params['email'], params['password'])
    p 'maker details'
    p maker
    session[:maker_id] = maker.id
    p session[:maker_id]
    redirect '/peeps'
  end

  get '/peeps' do
    p 'in peeps'
    p session[:maker_id]
    @maker = Maker.find(session[:maker_id]) unless session[:maker_id].nil?
    p @maker
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
