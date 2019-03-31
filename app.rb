require 'sinatra/base'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all(:order => [:id.desc])
    erb :view_peeps
  end

  post '/peep' do
    Peep.create(content: params[:peep_content])
    redirect '/'
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(name: params['name'],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password])
    session[:user] = user.id
    redirect '/users/account_created'
  end

  get '/users/account_created' do
    @user = User.get(session[:user])
    erb :account_created
  end
end
