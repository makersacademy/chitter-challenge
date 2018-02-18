require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  DatabaseConnection.setup("chitter")

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  post '/post-peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :"new-user"
  end

  post "/users" do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

end
