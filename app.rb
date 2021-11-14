require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'

class ChitterPage < Sinatra::Base

  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(username: params[:username], password: params[:password])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/add-peep' do
    Peep.add(params[:username], params[:message])
    redirect :peeps
  end

  run! if app_file == $0

end
