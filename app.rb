require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(post: params[:peep])
    redirect('/peeps')
  end

  get '/user/signup' do
    erb(:signup)
  end

  post '/user' do
    @user = User.create(params[:name], params[:username], params[:email], params[:password])
    session[:current_user] = user.id
    redirect '/peeps'
  end

  get 'user/peeps' do
    @peeps = Peep.all
    erb(:'peeps')
  end


  run! if app_file == $0
end
