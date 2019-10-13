require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  
  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    @message = Peep.create(message: params[:peep])
    redirect('/peeps')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  run! if app_file == $0
end