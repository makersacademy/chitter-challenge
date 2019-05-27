require 'sinatra/base'
require './lib/user'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/chitter' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    @user = user.username
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end

  post '/chitter/new' do
    Peep.create(message: params[:message])
    redirect '/chitter'
  end
  
  run! if app_file == $0
end
