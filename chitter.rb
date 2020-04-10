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
    session[:maker_id] = maker.id
    redirect '/peeps'
  end

  get '/peeps' do
    @maker = Maker.find(session[:maker_id]) unless session[:maker_id].nil?
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
