require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :user
  end

  post '/peeps/new' do
    Peep.create(params[:peep])
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.view.reverse
    erb :peeps
  end

  post '/users' do
    user = User.create(params[:email], params[:password])
    session[:email] = params[:email]
    redirect('/user/welcome')
  end

  get '/user/welcome' do
    @user = session[:email]
    erb :welcome
  end 
 

end
