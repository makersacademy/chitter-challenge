require 'sinatra/base'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    erb :"index"
  end

  post '/user' do
    @User = User.sign_up(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect '/peep/new'
  end

  get '/peep' do
    @peeps = Peeps.all
    erb :"peep/index"
  end

  get '/peep/new' do
    @user = User.name
    erb :"peep/new"
  end

  post '/peep' do
    Peeps.create(peep: params[:peep])
    @peeps = Peeps.all
    erb :"peep/index"
    redirect '/peep'
  end

  run! if app_file == $0
end
