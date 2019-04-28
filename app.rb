require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/chitter' do
    erb(:'chitter/index')
  end

  get '/chitter/sign_up' do
    erb(:'chitter/sign_up')
  end

  post '/chitter/user' do
    p params
    User.create(name: params[:name], username: params[:username])
    redirect '/chitter'
  end

  post '/chitter/log' do
    p params
    Peep.create(peep: params[:peep], time: params[:time])
    redirect '/chitter/view'
  end

  get '/chitter/view' do
    @name = params[:name]
    @peeps = Peep.all.reverse
    erb(:'chitter/view')
  end

  run! if app_file == $0
end
